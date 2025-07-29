@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds For Plant Section F4'
@Search.searchable: true
@ObjectModel.dataCategory: #VALUE_HELP
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity  ZI_PlantSection_f4 as select from I_MaintenanceOrderDEX as a
{
 @ObjectModel.text.element: ['plantsection']  
 @Search.defaultSearchElement: true 
 @Search.ranking: #HIGH
 @Search.fuzzinessThreshold: 0.8
key a.PlantSection

} 
group by 
PlantSection
