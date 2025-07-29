@EndUserText.label: 'RESPONCE CDS'
@Metadata.allowExtensions: true

@ObjectModel: {
    query: {
        implementedBy: 'ABAP:ZPARTS_LIFE_CYCLE_CLASS'
    }
}
//               Gajendra Singh
define root custom entity zparts_life_cycle_cds1

{

      @UI.lineItem             : [{ position: 10 }]
      @EndUserText.label       : 'Maintenance Order'
  key maintenanceorder         : abap.char( 12 );

      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Maintenance Order Type'
  key maintenanceordertype     : abap.char( 10 );


      @UI.lineItem             : [{ position: 30 }]
      @EndUserText.label       : 'Scheduled Basic Start Date'
  key scheduledbasicstartdate  : abap.dats;

      @UI.lineItem             : [{ position: 40 }]
      @UI.selectionField       : [{position: 10}]
      @UI.identification       : [{position: 10}]
          @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'ZI_WorkCenter_F4',
                     element: 'WorkCenter' }
        }] 
     @EndUserText.label       : 'Main Work Center'
  key mainworkcenter           : abap.char( 10 );

      @UI.lineItem             : [{ position: 50 }]
      @EndUserText.label       : 'Main Work Center Plant'
  key mainworkcenterplant      : abap.char( 10 );

      @UI.lineItem             : [{ position: 60 }]
      @UI.selectionField       : [{position: 20}]
      @UI.identification       : [{position: 20}]
      @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'ZI_MAINTAIN_PLANNING_PLANT',
                     element: 'MaintenancePlanningPlant' }
        }] 
      @EndUserText.label       : 'Maintenance Planning Plant'
   key maintenanceplanningplant : abap.char( 10 );

      @UI.lineItem             : [{ position: 70 }]
      @EndUserText.label       : 'Company Code'
   key    companycode              : abap.char( 10 );

      @UI.lineItem             : [{ position: 80 }]
        @UI.selectionField       : [{position: 20}]
      @UI.identification       : [{position: 20}]
      @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'i_maintenanceorderdex',
                     element: 'CostCenter' }
        }] 
      @EndUserText.label       : 'Cost Center'
   key    costcenter               : abap.numc( 10 );

      @UI.lineItem             : [{ position: 90 }]
      @UI.selectionField       : [{position: 20}]
      @UI.identification       : [{position: 20}]
      @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'I_Equipment',
                     element: 'Equipment' }
        }] 
      @EndUserText.label       : 'Equipment'
  key equipment                : abap.char( 20 );
      
      @UI.lineItem             : [{ position: 100 }]
      @EndUserText.label       : 'Material Document Item Text'
  key materialdocumentitemtext : abap.char( 40 ); 

      @UI.lineItem             : [{ position: 110 }]
      @UI.selectionField       : [{position: 110}]
      @UI.identification       : [{position: 20}]
      @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'ZPRODUCT_F4',
                     element: 'Product' }
        }] 
      @EndUserText.label       : 'Material'
  key material                 : abap.char( 40 );
  
        @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Life_Cycle'
  key life_cycle               : abap.int4;
      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Equipment Name'
      equipmentname            : abap.char( 40 );

      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Functional Location'
      functionallocation       : abap.char( 40 );

      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Maintenance Activity Type'
      maintenanceactivitytype  : abap.char( 10 );

      @UI.lineItem             : [{ position: 20 }]
      @UI.selectionField       : [{position: 30}]
      @UI.identification       : [{position: 30}]
      @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'ZI_PlantSection_f4',
                     element: 'PlantSection' }
        }] 
      @EndUserText.label       : 'Plant Section'
      plantsection             : abap.char( 20 );

      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Issuing Plant'
      plant                    : abap.char( 10 );

      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Issuing Storage Location'
      storagelocation          : abap.char( 10 );

      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Reservation'
      reservation              : abap.char( 10 );

      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Reservation Item'
      reservationitem          : abap.char( 10 );

      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Goods Recipient Name'
      goodsrecipientname       : abap.char( 40 );

      @UI.lineItem             : [{ position: 20 }]
      @UI.selectionField       : [{position: 20}]
      @UI.identification       : [{position: 20}]
      @EndUserText.label       : 'Posting Date'
      postingdate              : abap.dats;

      @UI.lineItem             : [{ position: 20 }]
      @EndUserText.label       : 'Maintenance Order Desc'
      maintenanceorderdesc     : abap.char( 40 );


      @EndUserText.label       : 'Entry Unit'
      @UI.lineItem             : [{ position: 20 }]
      EntryUnit                : abap.unit( 3 );
      @EndUserText.label       : 'Quantity Entry Unit'
      @UI.lineItem             : [{ position: 20 }]
      @Semantics.quantity.unitOfMeasure: 'EntryUnit'
      @Aggregation.default     : #SUM
      quantityinentryunit      : abap.dec( 16, 3 );
      @EndUserText.label       : 'CompanyCodeCurrency'
      @UI.lineItem             : [{ position: 20 }]
      CompanyCodeCurrency      : abap.cuky( 5 );
      @EndUserText.label       : 'Total Goods Amt In Currency'
      @UI.lineItem             : [{ position: 20 }]
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      @Aggregation.default     : #SUM
      totalgoodsmvtamtincccrcy : abap.dec( 13, 2 );
      @UI.lineItem             : [{ position: 20 }]
       @UI.selectionField       : [{position: 30}]
      @UI.identification       : [{position: 30}]
      @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'ZPRODUCT_GROUP_F4',
                     element: 'ProductGroup' }
        }] 
      MaterialGroup            : abap.char( 40 );
      @UI.lineItem             : [{ position: 20 }]
      MaterialDescription      : abap.char( 50 );
       @UI.selectionField       : [{position: 30}]
      @UI.identification       : [{position: 30}]
      @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'ZPM_TechnicalObject_F4',
                     element: 'TechnicalObjectType' }
        }] 
      @UI.lineItem             : [{ position: 20 }]
      TechnicalObjcetType      : abap.char( 40 );
      @UI.selectionField       : [{position: 30}]
      @UI.identification       : [{position: 30}]
      PurchaseOrder            : abap.char( 10 );
      @UI.selectionField       : [{position: 30}]
      @UI.identification       : [{position: 30}]
      PurchaseRequisition      : abap.char( 10 );
      @UI.selectionField       : [{position: 30}]
      @UI.identification       : [{position: 30}]
      @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'ZPM_SubPhaseCode_F4',
                     element: 'MaintOrdProcessSubPhaseCode' }
        }] 
      @UI.lineItem             : [{ position: 30 }]
      MaintOrdProcessSubPhaseCode    : abap.numc( 4 );


}
