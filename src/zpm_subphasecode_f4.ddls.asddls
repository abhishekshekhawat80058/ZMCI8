@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds For SubPhase Code F4'
@Search.searchable: true
@ObjectModel.dataCategory: #VALUE_HELP
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZPM_SubPhaseCode_F4 as select from I_MaintenanceOrderDEX
{   
 @ObjectModel.text.element: ['MaintOrdProcessSubPhaseCode']  
 @Search.defaultSearchElement: true 
 @Search.ranking: #HIGH
 @Search.fuzzinessThreshold: 0.8
 key MaintOrdProcessSubPhaseCode ,
 @Search.defaultSearchElement: true 
 @Search.ranking: #LOW 
 @Search.fuzzinessThreshold: 0.8 
 case when MaintOrdProcessSubPhaseCode = '0035' then 'In Planning'
  when MaintOrdProcessSubPhaseCode = '0055' then 'In Preparation'
  when MaintOrdProcessSubPhaseCode = '0060' then 'Ready To Schedule'
  when MaintOrdProcessSubPhaseCode = '0065' then 'Ready For Execution'
  when MaintOrdProcessSubPhaseCode = '0070' then 'Main Work Started'
  when MaintOrdProcessSubPhaseCode = '0080' then 'Work Done (Order)'
  when MaintOrdProcessSubPhaseCode = '0085' then 'Technically Complete(order'
  when MaintOrdProcessSubPhaseCode = '0095' then 'Close order'
  when MaintOrdProcessSubPhaseCode = '0092' then 'Work Not Performed'
  when MaintOrdProcessSubPhaseCode = '0105' then 'Deletion Flag' else '' end as SubPhase
} 

group by 
MaintOrdProcessSubPhaseCode
