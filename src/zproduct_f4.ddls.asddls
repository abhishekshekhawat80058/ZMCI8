@AbapCatalog.sqlViewName: 'YPRODUCT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZPRODUCT_F4'
define view ZPRODUCT_F4 as select from I_Product

{
 @ObjectModel.text.element: ['Product']  
 @Search.defaultSearchElement: true 
 @Search.ranking: #HIGH
 @Search.fuzzinessThreshold: 0.8
key   Product,
 @Search.defaultSearchElement: true
 @Search.ranking: #LOW
 @Search.fuzzinessThreshold: 0.8
 ProductManufacturerNumber,
 @Search.defaultSearchElement: true
 @Search.ranking: #LOW
 @Search.fuzzinessThreshold: 0.8
 ProductType,
 @Search.defaultSearchElement: true 
 @Search.ranking: #LOW 
 @Search.fuzzinessThreshold: 0.8   
      _Text[  left outer where Language = 'E'  ].ProductName
      
}
