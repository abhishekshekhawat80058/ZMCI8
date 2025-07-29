@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds For Work Center F4'
@Search.searchable: true
@ObjectModel.dataCategory: #VALUE_HELP
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_WorkCenter_F4 as select from I_WorkCenter as a 
left outer join I_WorkCenterText as b on ( b.WorkCenterInternalID = a.WorkCenterInternalID and b.Language = 'E' )
{
    
 @ObjectModel.text.element: ['WorkCenter']  
 @Search.defaultSearchElement: true 
 @Search.ranking: #HIGH
 @Search.fuzzinessThreshold: 0.8
key a.WorkCenter,
 @Search.defaultSearchElement: true 
 @Search.ranking: #LOW 
 @Search.fuzzinessThreshold: 0.8   
    b.WorkCenterText
      
}
 where a.WorkCenterCategoryCode = '0005'
group by 
a.WorkCenter,
b.WorkCenterText
