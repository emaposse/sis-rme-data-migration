# 1. Introdução

Este repositório contém os artefactos necessários para a execução dos processos de **Migração de Dados** do **SESP** para o **SIS-RME** e de **Sincronização de Dados** do **SIS-RME** para o **SESP**.

O objetivo é disponibilizar um conjunto padronizado de configurações, scripts e instruções que permitam executar ambos os processos de forma **consistente, repetível e auditável**, reduzindo o esforço de configuração e garantindo a rastreabilidade das operações realizadas.

A documentação completa sobre os princípios, a estratégia e as decisões técnicas que orientaram estes processos pode ser consultada no documento:

👉 **Estratégia de Migração de Dados**

https://docs.google.com/document/d/1cdcfnWA0PEp-Ljzk6CdlJJb8HrWGnkZwvIg6qTXknN4/edit?usp=sharing

---

## Visão Geral

A Migração de Dados e a Sincronização de Dados utilizam a ferramenta ETL **sis-rme-etl**, responsável pela extração, transformação e carregamento dos dados entre o SESP e o SIS-RME.

Repositório da ferramenta:

👉 https://github.com/MISAU-DIS/sis-rme-etl/tree/master

O comportamento da ferramenta é definido através de ficheiros de configuração em formato **JSON**, que especificam:

- as regras de transformação de dados;
- o mapeamento entre as estruturas do SESP e do SIS-RME;
- o fluxo de execução de cada processo.

A configuração utilizada determina se a ferramenta será executada em modo **Migração** ou em modo **Sincronização**, reutilizando a mesma infraestrutura de execução.

Para mais detalhes sobre o funcionamento interno da ferramenta ETL, consulte a documentação do projeto **sis-rme-etl**.



# 2. Antes de Começar

Esta secção descreve os requisitos necessários para preparar o ambiente antes da execução dos processos de Migração ou Sincronização.

## Pré-requisitos

Antes de iniciar a configuração do ambiente, certifique-se de que os seguintes requisitos estão cumpridos:

- **Java 17** ou superior instalado;
- acesso à base de dados **SESP**;
- servidor **MySQL 8.0.4** ou superior;
- credenciais válidas de acesso à base de dados (utilizador e palavra-passe);
- endereço do servidor (host) e porta de acesso.

## Download dos Artefactos

Descarregue a versão mais recente dos artefactos de Migração e Sincronização disponível na página de *Releases* do projeto:

👉 https://github.com/MISAU-DIS/sis-rme-data-migration/releases

Após o download, descompacte o ficheiro num diretório da sua preferência. Esse diretório será utilizado como diretório raiz da aplicação ao longo deste documento.

## Estrutura dos Artefactos

Após a extração da release, a estrutura de diretórios será semelhante à seguinte:

| Diretório | Descrição |
|-----------|-----------|
| `app/` | Contém a aplicação ETL e os respetivos ficheiros executáveis. |
| `conf/` | Contém os ficheiros de configuração utilizados pela Migração e pela Sincronização. |
| `dump-scripts/` | Contém scripts SQL auxiliares utilizados durante os processos de Migração e Sincronização. |
| `sh/` | Contém scripts para iniciar, monitorizar, reiniciar e interromper a execução da aplicação. |

Nos capítulos seguintes serão detalhados os ficheiros de configuração e os scripts disponíveis em cada um destes diretórios.

# 3. Configuração do Ambiente

A configuração da aplicação é efetuada através do ficheiro `env.properties`, localizado no diretório raiz dos artefactos.

Este ficheiro deve ser criado a partir do modelo disponibilizado em:

```text
conf/env.template.properties
```

Todas as configurações necessárias para a execução da Migração ou da Sincronização são definidas neste ficheiro.

---

## Configuração Inicial vs Configuração de Produção

As configurações disponibilizadas neste projeto correspondem à **Configuração Inicial**, também designada por **configuração de fábrica**.

Esta configuração privilegia a segurança e a capacidade de diagnóstico durante as primeiras execuções da aplicação, sendo recomendada para a validação inicial do ambiente.

Nesta fase, a aplicação adota uma estratégia de execução mais conservadora, caracterizada por:

- interrupção imediata do processamento perante erros inesperados;
- produção de informação detalhada nos logs;
- processamento otimizado para facilitar a identificação de problemas de configuração.

Esta abordagem permite identificar rapidamente situações como:

- utilização da base de dados de origem incorreta;
- utilização da base de dados de destino incorreta;
- execução do modo **Migração** quando se pretendia executar **Sincronização**, ou vice-versa;
- configuração incorreta do Departamento de HIV ou do Serviço TARV;
- definição incorreta dos filtros de Migração;
- inconsistências inesperadas nos dados.

Após confirmar que:

- o ambiente está corretamente configurado;
- os resultados produzidos são consistentes;
- não existem erros inesperados durante um período representativo de execução;

recomenda-se alterar algumas configurações para os valores indicados para **Produção**.

A Configuração de Produção mantém exatamente o mesmo comportamento funcional da aplicação, mas privilegia o desempenho, reduzindo o volume de informação produzido nos logs e permitindo um processamento mais eficiente.

> **Recomendação**

> Execute sempre a primeira Migração ou Sincronização utilizando a Configuração Inicial. Apenas após validar o comportamento da aplicação deverá adotar as configurações recomendadas para Produção.

## Variáveis Comuns

As variáveis abaixo são utilizadas tanto nos processos de **Migração** como de **Sincronização**.

### Configuração Geral

| Variável | Descrição |
|----------|-----------|
| `location_name` | Nome da Unidade Sanitária. Ex.: `cs_molocue`. |
| `etl_root_dir` | Caminho absoluto para o diretório raiz dos artefactos da aplicação. |

---

## Ligação às Bases de Dados

As variáveis seguintes definem as ligações às bases de dados utilizadas durante a execução.

### Base de Dados de Origem

| Variável | Descrição |
|----------|-----------|
| `src_db` | Base de dados de origem. Na **Migração**, corresponde à base de dados do **SESP** (ex.: `openmrs_cs_molocue`). Na **Sincronização**, corresponde à base de dados de *Stage* (ex.: `sisrme_sesp_sync_stage_area`). Durante a configuração inicial da Sincronização, esta base de dados pode ainda não existir. |
| `srcUserName` | Utilizador da base de dados de origem. |
| `srcUserPassword` | Palavra-passe da base de dados de origem. |
| `srcConnectionURI` | URI de ligação à base de dados de origem. |

Exemplo:

```properties
jdbc:mysql://localhost:3307/openmrs_cs_molocue?autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true
```

### Base de Dados de Destino

| Variável | Descrição |
|----------|-----------|
| `dst_db` | Base de dados de destino. Na **Migração**, corresponde à base de dados do **SIS-RME**. Na **Sincronização**, corresponde à base de dados do **SESP**. |
| `dstUserName` | Utilizador da base de dados de destino. |
| `dstUserPassword` | Palavra-passe da base de dados de destino. |
| `dstConnectionURI` | URI de ligação à base de dados de destino. |

Exemplo:

```properties
jdbc:mysql://localhost:3307/sisrme_db?autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true
```

## Configuração de Execução

As variáveis seguintes controlam o comportamento da aplicação durante a execução.

| Variável | Descrição | Configuração Inicial | Configuração Recomendada |
|----------|-----------|----------------------|--------------------------|
| `run_in_debug_mode` | Ativa ou desativa o modo de *remote debug*, utilizado para depuração da aplicação. | `false` | `false` |
| `autoCommit` | Define se as transações são confirmadas (*commit*) no final de cada operação ou apenas no final de cada lote (*batch*). | `false` | `true` |
| `threadingMode` | Define o modo de processamento: sequencial (`SINGLE`) ou paralelo (`MULTI`). | `SINGLE` | `MULTI` |
| `processingBatch` | Número de registos processados por transação. | `2000` | Ajustar conforme o ambiente. |
| `log_level` | Nível de detalhe da informação registada nos logs (`WARN`, `INFO`, `DEBUG` e `TRACE`). | `DEBUG` | `WARN` |

### Notas

#### `autoCommit`

Durante a validação inicial recomenda-se manter `autoCommit=false`.

Desta forma, caso ocorra um erro durante o processamento, toda a transação será revertida (*rollback*), evitando que a base de dados fique num estado parcialmente atualizado.

Após confirmar que o processo decorre normalmente e que não existem erros inesperados, recomenda-se alterar esta configuração para `true`, permitindo confirmar cada operação individualmente e melhorando o desempenho global da aplicação.

> **Importante**
>
> Utilizar `autoCommit=true` pode deixar a base de dados num estado parcialmente atualizado caso ocorra uma falha durante o processamento. Esta configuração só deve ser utilizada após a validação inicial do ambiente.

---

#### `threadingMode`

A configuração inicial utiliza `SINGLE`, permitindo um processamento sequencial que facilita a identificação e análise de erros.

Após validar a estabilidade do processo, recomenda-se utilizar `MULTI`, permitindo o processamento paralelo de múltiplos registos e reduzindo significativamente o tempo total de execução.

---

#### `processingBatch`

O valor por omissão (`2000`) é adequado para a maioria dos cenários.

Em ambientes onde existam grandes intervalos (*gaps*) entre os identificadores (`id`) dos registos, poderá ser vantajoso aumentar este valor para melhorar o desempenho.

---

#### `log_level`

Durante a configuração inicial recomenda-se utilizar `DEBUG`, permitindo acompanhar detalhadamente a execução da aplicação.

Após validar o ambiente, recomenda-se alterar o nível de log para `WARN`, reduzindo o volume de informação produzida e melhorando ligeiramente o desempenho.

## Tratamento de Erros

As variáveis seguintes definem o comportamento da aplicação perante erros de execução e inconsistências de dados.

| Variável | Descrição | Configuração Inicial | Configuração Recomendada |
|----------|-----------|----------------------|--------------------------|
| `defaultExceptionBehavior` | Define a ação a tomar quando ocorre uma exceção inesperada durante o processamento. | `ABORT_PROCESS` | `LOG` |
| `defaultInconsistencyBehavior` | Define a ação a tomar quando são detetadas inconsistências nos dados. | `ABORT_PROCESS` | `MARK_RECORD_AS_FAILED` |

### Notas

#### `defaultExceptionBehavior`

Durante a configuração inicial, recomenda-se utilizar o valor `ABORT_PROCESS`.

Nesta configuração, qualquer exceção inesperada interrompe imediatamente a execução da aplicação, permitindo identificar rapidamente problemas de configuração, erros de transformação ou situações não previstas.

Após validar o ambiente e confirmar que o processo decorre normalmente, recomenda-se alterar esta variável para `LOG`. Neste modo, as exceções já conhecidas são registadas nas tabelas de log para posterior análise, permitindo que o processamento continue sem interrupções.

> **Recomendação**
>
> Utilize `ABORT_PROCESS` durante a fase de validação inicial e altere para `LOG` apenas quando o ambiente estiver estabilizado.

---

#### `defaultInconsistencyBehavior`

Uma **inconsistência** corresponde a um registo que não pode ser migrado ou sincronizado de forma consistente, normalmente devido à ausência de informação de suporte.

Este cenário ocorre, por exemplo, quando um registo referencia um metadado inexistente ou quando uma relação entre tabelas deixaria de ser válida após a transformação dos dados.

Durante a configuração inicial, recomenda-se utilizar `ABORT_PROCESS`, interrompendo imediatamente o processamento sempre que seja detetada uma inconsistência inesperada.

Após validar o ambiente, recomenda-se utilizar `MARK_RECORD_AS_FAILED`. Neste modo, os registos inconsistentes são marcados como falhados e registados para posterior análise, permitindo que o restante processamento continue normalmente.

> **Nota**
>
> A utilização de `MARK_RECORD_AS_FAILED` é recomendada apenas quando as inconsistências conhecidas tiverem sido previamente analisadas e não comprometerem a integridade dos restantes dados.

## Configuração das Variáveis de Ambiente da Migração

As variáveis seguintes são utilizadas exclusivamente durante a execução da **Migração de Dados**.

| Variável | Descrição |
|----------|-----------|
| `mode` | Define o modo de execução da aplicação. Para Migração, deve ser configurado com o valor `db_migration`. |
| `src_location_list` | Lista dos identificadores (`location_id`) das unidades sanitárias a migrar. |
| `migr_destination_location_id` | Identificador do **Departamento de HIV** da Unidade Sanitária de destino no SIS-RME. Todos os dados migrados serão associados a esta localização. |
| `dst_tarv_service_id` | Identificador do Serviço TARV na base de dados do SIS-RME. |

### Filtros de Migração

As variáveis seguintes permitem restringir a Migração a um subconjunto específico de dados.

Quando configuradas com o valor `true`, não é aplicado qualquer filtro adicional e todos os registos elegíveis são considerados para Migração.

| Variável | Descrição |
|----------|-----------|
| `included_patient_extra_condition` | Condição SQL adicional aplicada às tabelas relacionadas com `patient`, como `patient`, `encounter`, `visit`, entre outras. |
| `included_person_extra_condition` | Condição SQL adicional aplicada às tabelas relacionadas com `person`, como `person`, `person_name`, `person_address` e `obs`. |
| `included_person_b_extra_condition` | Condição SQL adicional aplicada à extração da tabela `relationship`, filtrando os registos através do campo `person_b`. |

### Exemplos

Migrar apenas um conjunto específico de pacientes:

```properties
included_patient_extra_condition=patient_id IN (1001,1002,1003)
```

Migrar apenas um conjunto específico de pessoas:

```properties
included_person_extra_condition=person_id IN (1001,1002,1003)
```

Migrar apenas determinados relacionamentos:

```properties
included_person_b_extra_condition=person_b IN (1001,1002,1003)
```

> **Nota**
>
> Os filtros configurados nestas variáveis são automaticamente adicionados às consultas SQL geradas pela ETL para as respetivas entidades. Esta funcionalidade é particularmente útil para testes, validações ou migrações parciais.

## Configuração das Variáveis de Ambiente da Sincronização

As variáveis seguintes são utilizadas exclusivamente durante a execução da **Sincronização de Dados**.

| Variável | Descrição |
|----------|-----------|
| `mode` | Define o modo de execução da aplicação. Para Sincronização, deve ser configurado com o valor `db_synchronization`. |
| `extra_condition` | Condição SQL adicional utilizada para filtrar as mensagens a processar na tabela `sis_rme_sync_msg` da base de dados de *Stage*. |
| `sync_fragments` | Define os fragmentos de sincronização a executar. Por omissão, todos os fragmentos são processados. |

### Configuração por Omissão

Por defeito, a aplicação processa:

- todas as mensagens existentes na tabela `sis_rme_sync_msg`;
- todos os fragmentos de sincronização.

Esta configuração corresponde aos seguintes valores:

```properties
extra_condition=true
sync_fragments=sesp-sync-fragments/*.json
```

### Filtragem de Mensagens

A variável `extra_condition` permite restringir a Sincronização a um subconjunto específico de mensagens.

Por exemplo, para sincronizar apenas mensagens referentes à tabela `drug_order`:

```properties
extra_condition=table_name = 'drug_order'
```

### Filtragem de Fragmentos

A variável `sync_fragments` permite executar apenas determinados fragmentos de sincronização.

Esta funcionalidade é útil para testar ou analisar isoladamente uma parte específica do processo.

Por exemplo:

```properties
sync_fragments=sesp-sync-fragments/drug_order.json
```

### Utilização Combinada

As variáveis `extra_condition` e `sync_fragments` podem ser utilizadas em conjunto para restringir simultaneamente:

- os fragmentos executados pela ETL;
- as mensagens processadas em cada fragmento.

Exemplo:

```properties
sync_fragments=sesp-sync-fragments/drug_order.json
extra_condition=table_name = 'drug_order'
```

> **Nota**
>
> A utilização combinada destas variáveis é particularmente útil durante atividades de desenvolvimento, depuração, validação ou reprocessamento de tipos específicos de mensagens, permitindo reduzir significativamente o volume de dados processados.

# 4. Execução

Esta secção descreve os principais comandos disponíveis para executar e monitorizar a aplicação ETL.

## Iniciar a Aplicação

Para iniciar a Migração ou a Sincronização em segundo plano, execute:

```bash
./sh/run.in.background.sh
```

---

## Monitorizar a Execução

Para acompanhar a execução em tempo real através dos ficheiros de log:

```bash
./sh/tail_logs.sh
```

---

## Consultar o Estado da Aplicação

Para verificar se a aplicação está em execução:

```bash
./sh/show_status.sh
```

---

## Consultar Eventos de Sincronização

Durante a execução da Sincronização, é possível consultar a quantidade de eventos processados e o respetivo estado através do comando:

```bash
./sh/show_events.sh
```

> **Nota**
>
> Este comando é aplicável apenas ao processo de **Sincronização**.

---

## Parar a Aplicação

### Paragem Controlada (Recomendada)

Solicita à aplicação que termine o processamento de forma controlada, permitindo concluir a transação em curso e libertar os recursos utilizados.

```bash
./sh/request_stop.sh
```

> **Recomendação**
>
> Sempre que possível, utilize este comando para interromper a aplicação. Desta forma evita-se interromper operações em curso e reduz-se o risco de deixar o processamento incompleto.

### Paragem Imediata

Força a interrupção imediata da aplicação.

```bash
./sh/stop_service.sh
```

> **Atenção**
>
> Este comando deve ser utilizado apenas em situações excecionais, quando não seja possível efetuar uma paragem controlada.

---

## Reiniciar a Aplicação

Para reiniciar a aplicação:

```bash
./sh/restart.sh
```

# 5. Recomendações

Antes de executar uma Migração ou Sincronização em ambiente de produção, recomenda-se que sejam observadas as seguintes boas práticas:

- Certifique-se de que a base de dados de destino está devidamente preparada para receber os dados.
- Verifique que o **Departamento de HIV** e o respetivo **Serviço TARV** estão corretamente configurados na Unidade Sanitária de destino.
- Execute sempre uma primeira Migração ou Sincronização utilizando a **Configuração Inicial**, de forma a validar o ambiente e identificar eventuais problemas de configuração.
- Apenas após validar o comportamento da aplicação, altere as configurações recomendadas para **Produção**.
- Sempre que possível, execute inicialmente o processo num ambiente de testes antes da execução em produção.
- O processo foi concebido para ser **repetível**, podendo ser executado novamente após correções ou ajustes de configuração.

> **Recomendação**
>
> Antes de iniciar uma Migração ou Sincronização em produção, recomenda-se efetuar uma cópia de segurança (*backup*) das bases de dados envolvidas.

---

# 6. Suporte

Em caso de dúvidas, problemas técnicos ou necessidade de esclarecimentos adicionais, consulte:

- a documentação técnica do projeto;
- a documentação da ferramenta **sis-rme-etl**;
- a equipa responsável pelo processo de Migração e Sincronização de Dados.