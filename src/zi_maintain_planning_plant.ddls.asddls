@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MAINTAIN_PLANNING_PLANT'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_MAINTAIN_PLANNING_PLANT as select from I_MaintenanceOrderDEX as a
{
 @ObjectModel.text.element: ['MAINTENANCEPLANNINGPLANT']  
 @Search.defaultSearchElement: true 
 @Search.ranking: #HIGH
 @Search.fuzzinessThreshold: 0.8
key a.MaintenancePlanningPlant
}
 group by 
   a.MaintenancePlanningPlant
