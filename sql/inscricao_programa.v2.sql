
select 	inscricao.patient_id,
		inscricao.data_inscricao,
		trasferde.data_transferde,
		confidente.nomeConfidente,
		confidente.parentescoCoded,
		confidente.parentescoDesc,
		confidente.telefoneConfidente,
		confidente.enderecoConfidente,
		consentimento.data_consent_confidente,
		consentimento.consentimentoCodedConfidente,
		consentimento.consentimentoDescConfidente,
		consentimento.meioContactoCodedConfidente,
		consentimento.meioContactoDescConfidente,
		consentPaciente.data_consent_paciente,
		consentPaciente.consentimentoCodedPaciente,
		consentPaciente.consentimentoDescPaciente,
		consentPaciente.meioContactoDescPaciente,
		consentPaciente.meioContactoCodedPaciente
from 
(
	-- SQL1: Inscrição ao ProgramaID=2, Location=Departamento HIV, Estado = 91 (inscrito)
	select inscricao.patient_id,min(data_inscricao) data_inscricao
	from 
	(
		select 	p.patient_id,min(e.encounter_datetime) data_inscricao 
		from 	patient p inner join encounter e on e.patient_id=p.patient_id 
		where 	e.voided=0 and p.voided=0 and e.encounter_type in (5,7) and e.encounter_datetime<=curdate() and e.location_id in (:location)
		group by p.patient_id

		union

		select 	pg.patient_id,min(date_enrolled) data_inscricao
		from 	patient p inner join patient_program pg on p.patient_id=pg.patient_id
		where 	pg.voided=0 and p.voided=0 and program_id in (1,2) and date_enrolled<=curdate() and location_id in (:location)
		group by p.patient_id

		union

		Select 	p.patient_id,min(o.value_datetime) data_inscricao
		from 	patient p
				inner join encounter e on p.patient_id=e.patient_id
				inner join obs o on e.encounter_id=o.encounter_id
		where 	p.voided=0 and e.voided=0 and o.voided=0 and e.encounter_type=53 and 
				o.concept_id=23891 and o.value_datetime is not null and 
				o.value_datetime<=curdate() and e.location_id in (:location)
		group by p.patient_id
	) inscricao
	group by inscricao.patient_id
) inscricao
left join 

(
	-- SQL2: Para criação de Transferidos De: Sem incluir a US de transferido de pois no SESP não Obedece Hierarquia do SIS-RME
	select patient_id,max(minStateDate) data_transferde
	from 
	(
		Select 	p.patient_id,obsTrans.obs_datetime as minStateDate
		from 	patient p
				inner join encounter e on p.patient_id=e.patient_id
				inner join obs obsTrans on e.encounter_id=obsTrans.encounter_id and obsTrans.voided=0 and obsTrans.concept_id=1369 and obsTrans.value_coded=1065
		where 	p.voided=0 and e.voided=0 and e.encounter_type=53 and e.location_id= in (:location) and obsTrans.obs_datetime<=curdate()
				
		union 	
				
		select minState.patient_id,minState.minStateDate 
		from  (
					SELECT 	p.patient_id, pg.patient_program_id, MIN(ps.start_date) as minStateDate  
					FROM 	patient p  
							inner join patient_program pg on p.patient_id=pg.patient_id 
							inner join patient_state ps on pg.patient_program_id=ps.patient_program_id 
					WHERE 	pg.voided=0 and ps.voided=0 and p.voided=0 and pg.program_id=2 
							and location_id in (:location)  and ps.start_date<=curdate() 
					GROUP BY pg.patient_program_id
			) minState 
			inner join patient_state ps on ps.patient_program_id=minState.patient_program_id 
			where ps.start_date=minState.minStateDate and ps.state=29 and ps.voided=0 
	) trasferde
	group by trasferde.patient_id
) trasferde on trasferde.patient_id=inscricao.patient_id
left join 

(
	-- SQL3: Confidentes dos pacientes a partir da ficha resumo. Repare que os dois telefones se existirem estao separados por virgula no mesmo campo
	select patient_id,nomeConfidente,parentescoCoded,parentescoDesc,
			GROUP_CONCAT(telefoneConfidente) telefoneConfidente,
			enderecoConfidente
	from 
	(
		Select 	p.patient_id,
				obsNome.value_text nomeConfidente,
				obsParentesco.value_coded parentescoCoded,
				case obsParentesco.value_coded			
					when 1930 then 'Amigo ou Colega'
					when 973 then 'Avo'
					when 2036 then 'Chefe do Bairro'
					when 23707 then 'Filho'
					when 972 then 'Irmão'
					when 970 then 'Mãe'
					when 23708 then 'Neto'
					when 971 then 'Pai'				
					when 1921 then 'Parceiro'
					when 23705 then 'Primo'
					when 975 then 'Tia'
					when 23706 then 'Trabalhador'
					when 2034 then 'Vizinho'
					when 5622 then 'Outro'
				else null end as parentescoDesc,
				obsTelefone.value_text telefoneConfidente,
				obsEndereco.value_text enderecoConfidente
		from 	patient p 
				inner join encounter e on p.patient_id=e.patient_id	
				inner join obs obsNome on e.encounter_id=obsNome.encounter_id and obsNome.concept_id=1740 and obsNome.voided=0
				left join obs obsParentesco on obsParentesco.encounter_id=e.encounter_id and obsParentesco.concept_id=23704 and obsParentesco.voided=0
				left join obs obsTelefone on  obsTelefone.encounter_id=e.encounter_id and obsTelefone.concept_id=6224 and obsTelefone.voided=0
				left join obs obsEndereco on  obsEndereco.encounter_id=e.encounter_id and obsEndereco.concept_id=2067 and obsEndereco.voided=0			
		where 	e.voided=0 and p.voided=0 and 
				e.encounter_type=53 and e.location_id in (:location) and e.encounter_datetime<=curdate()
	) confidente
	group by confidente.patient_id
) confidente on confidente.patient_id=inscricao.patient_id
left join 

(
	-- SQL4: Somente leva-se o ultimo assessmente feito se o confidente concorda a partir da ficha de APSS. Repare que os meios estão separados por virgula, se existirem
	select 	patient_id,data_consent_confidente,consentimentoCodedConfidente,consentimentoDescConfidente,
			GROUP_CONCAT(meioContactoDescConfidente) meioContactoDescConfidente,
			GROUP_CONCAT(meioContactoCodedConfidente) meioContactoCodedConfidente
	from 
	(
		Select 	ultimoAssess.patient_id,
				ultimoAssess.data_consent_confidente,
				ultimoAssess.value_coded consentimentoCodedConfidente,
				if(ultimoAssess.value_coded=1065,'Sim','Não') consentimentoDescConfidente,
				case o.value_coded			
					when 6307 then 'Contacto Telefonico'
					when 23719 then 'SMS'
					when 2071 then 'Visita Domiciliaria'
				else null end as meioContactoDescConfidente,
				o.value_coded meioContactoCodedConfidente
				
		from 	
				(
					select 	p.patient_id,max(e.encounter_datetime) data_consent_confidente,o.value_coded 
					from 	patient p 
							inner join encounter e on p.patient_id=e.patient_id
							inner join obs o on o.encounter_id=e.encounter_id
					where 	p.voided=0 and e.voided=0 and o.voided=0 and 
							e.encounter_type=35 and e.location_id in (:location) and e.encounter_datetime<=curdate() and 
							o.concept_id=6177
					group by p.patient_id
				) ultimoAssess
				inner join encounter e on ultimoAssess.patient_id=e.patient_id 
				left join obs o on o.encounter_id=e.encounter_id and o.concept_id=23889 and o.voided=0 
				where 	ultimoAssess.data_consent_confidente=e.encounter_datetime and e.voided=0 and e.encounter_type=35 and 
						e.location_id in (:location) and e.encounter_datetime<=curdate()
	) consentimento
	group by consentimento.patient_id
) consentimento on consentimento.patient_id=inscricao.patient_id
left join 

(
	-- SQL5: Somente leva-se o ultimo assessmente feito se o paciente aceita contacto a partir da ficha de APSS. Repare que os meios estão separados por virgula, se existirem
	select 	patient_id,data_consent_paciente,consentimentoCodedPaciente,consentimentoDescPaciente,
			GROUP_CONCAT(meioContactoDescPaciente) meioContactoDescPaciente,
			GROUP_CONCAT(meioContactoCodedPaciente) meioContactoCodedPaciente
	from 
	(
		Select 	ultimoAssess.patient_id,
				ultimoAssess.data_consentimento data_consent_paciente,
				ultimoAssess.value_coded consentimentoCodedPaciente,
				if(ultimoAssess.value_coded=1065,'Sim','Não') consentimentoDescPaciente,
				case o.value_coded			
					when 6307 then 'Contacto Telefonico'
					when 23719 then 'SMS'
					when 2071 then 'Visita Domiciliaria'
				else null end as meioContactoDescPaciente,
				o.value_coded meioContactoCodedPaciente
				
		from 	
				(
					select 	p.patient_id,max(e.encounter_datetime) data_consentimento,o.value_coded 
					from 	patient p 
							inner join encounter e on p.patient_id=e.patient_id
							inner join obs o on o.encounter_id=e.encounter_id
					where 	p.voided=0 and e.voided=0 and o.voided=0 and 
							e.encounter_type=35 and e.location_id in (:location) and e.encounter_datetime<=curdate() and 
							o.concept_id=6306
					group by p.patient_id
				) ultimoAssess
				inner join encounter e on ultimoAssess.patient_id=e.patient_id 
				left join obs o on o.encounter_id=e.encounter_id and o.concept_id=6309 and o.voided=0 
				where 	ultimoAssess.data_consentimento=e.encounter_datetime and e.voided=0 and e.encounter_type=35 and 
						e.location_id in (:location) and e.encounter_datetime<=curdate()
	) consentPaciente
	group by consentPaciente.patient_id
)consentPaciente on consentPaciente.patient_id=inscricao.patient_id



-- SQL6: Situação de Contacto somente a partir da ficha resumo. Este não deve ser misturado com anteriores, pois traz duplicados 
select 	patient_id,
		primeiroNome,
		idade,
		parentescoCoded,
		parentescoDesc,
		estadoCoded,
		estadoDesc,
		nidFR
from 
(
	Select 	p.patient_id,
			obsNome.value_text primeiroNome,
			obsIdade.value_numeric idade,
			obsParentesco.value_coded parentescoCoded,
			case obsParentesco.value_coded			
				when 1930 then 'Amigo ou Colega'
				when 973 then 'Avo'
				when 2036 then 'Chefe do Bairro'
				when 23707 then 'Filho'
				when 972 then 'Irmão'
				when 970 then 'Mãe'
				when 23708 then 'Neto'
				when 971 then 'Pai'				
				when 1921 then 'Parceiro'
				when 23705 then 'Primo'
				when 975 then 'Tia'
				when 23706 then 'Trabalhador'
				when 2034 then 'Vizinho'
				when 5622 then 'Outro'
			else null end as parentescoDesc,
			obsTeste.value_coded estadoCoded,
			case obsTeste.value_coded 			
				when 703 then 'HIV+'
				when 664 then 'HIV-'
				when 1067 then 'Desconhecido'				
			else null end as estadoDesc,			
			obsNID.value_text nidFR
	from 	patient p 
			inner join encounter e on p.patient_id=e.patient_id	
			inner join obs obsGrupo on obsGrupo.encounter_id=e.encounter_id
			inner join obs obsNome on obsGrupo.obs_id=obsNome.obs_group_id and obsNome.concept_id=23778 and obsNome.voided=0
			left join obs obsParentesco on obsParentesco.obs_group_id=obsGrupo.obs_id and obsParentesco.concept_id=23704 and obsParentesco.voided=0
			left join obs obsIdade on  obsIdade.obs_group_id=obsGrupo.obs_id and obsIdade.concept_id=23777 and obsIdade.voided=0
			left join obs obsTeste on  obsTeste.obs_group_id=obsGrupo.obs_id and obsTeste.concept_id=23779 and obsTeste.voided=0
			left join obs obsNID on  obsNID.obs_group_id=obsGrupo.obs_id and obsNID.concept_id=23781 and obsNID.voided=0			
	where 	e.voided=0 and obsGrupo.voided=0 and p.voided=0 and 
			e.encounter_type=53 and obsGrupo.concept_id=23782  and e.location_id= in (:location) and e.encounter_datetime<=curdate()
) situacaoContacto