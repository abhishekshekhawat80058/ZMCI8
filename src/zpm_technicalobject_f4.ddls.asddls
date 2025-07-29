@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds For Technical Object F4 All Program'
@Search.searchable: true
@ObjectModel.dataCategory: #VALUE_HELP
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZPM_TechnicalObject_F4 as select from I_TechnicalObject as a 
left outer join I_TechnicalObjectTypeText as b on (b.TechnicalObjectType = a.TechnicalObjectType and b.Language = 'E' )
{
  @ObjectModel.text.element: ['TechnicalObjectType']  
 @Search.defaultSearchElement: true 
 @Search.ranking: #HIGH
 @Search.fuzzinessThreshold: 0.8
key a.TechnicalObjectType,
 @Search.defaultSearchElement: true 
 @Search.ranking: #LOW 
 @Search.fuzzinessThreshold: 0.8   
    b.TechnicalObjectTypeDesc
      
}

group by 
a.TechnicalObjectType,
b.TechnicalObjectTypeDesc
