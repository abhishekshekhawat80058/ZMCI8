@AbapCatalog.sqlViewName: 'YPRODUCT_GROUP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZPRODUCT_GROUP_F4'
define view ZPRODUCT_GROUP_F4 as select from I_Product as a 
left outer join I_ProductGroupText_2 as b on (b.ProductGroup = a.ProductGroup and b.Language = 'E' )

{
 @ObjectModel.text.element: ['ProductGroup']  
 @Search.defaultSearchElement: true 
 @Search.ranking: #HIGH
 @Search.fuzzinessThreshold: 0.8
key a.ProductGroup,
 @Search.defaultSearchElement: true 
 @Search.ranking: #LOW 
 @Search.fuzzinessThreshold: 0.8   
 b.ProductGroupName
      
}

group by 
a.ProductGroup,
b.ProductGroupName
