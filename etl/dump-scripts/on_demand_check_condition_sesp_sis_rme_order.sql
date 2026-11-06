    order_type_id   =  ${order_type_id} 
and patient_id      =  ${aliases_prefix}_encounter_dst_ds.patient_id 
and concept_id      =  ${aliases_prefix}_transformed_result_concept_src_ds.concept_id  
and scheduled_date  =  (    select max(max_order.scheduled_date) scheduled_date
                            from orders max_order left join test_result inner_test_result on max_order.order_id = inner_test_result.order_id
                            where max_order.scheduled_date =    (   select  max(inner_order.scheduled_date) scheduled_date
                                                                    from    orders inner_order      
                                                                    where   inner_order.scheduled_date      <=  ${aliases_prefix}_result_obs_src_ds.obs_datetime
                                                                            and inner_order.order_type_id   =   ${order_type_id}
                                                                            and inner_order.patient_id      =   ${aliases_prefix}_encounter_dst_ds.patient_id 
                                                                            and inner_order.concept_id      =  ${aliases_prefix}_transformed_result_concept_src_ds.concept_id
                                                                )
                            and inner_test_result.order_id is null 
                        )


