@AbapCatalog.sqlViewName: 'YPARTSLIFE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds For Parts Life Cycle Report'
define view zparts_life_cycle_cds as select from I_MaintenanceOrderDEX as a
left outer join I_MaterialDocumentItem_2 as b on ( b.OrderID = a.MaintenanceOrder )
{
         key  a.MaintenanceOrder        ,
         key  a.MaintenanceOrderType    ,
         key  a.MaintenanceOrderDesc    ,
         key  a.ScheduledBasicStartDate ,
        // SELECTION 
         key  a.MainWorkCenter          ,
         key  a.MainWorkCenterPlant     ,
         
         key  a.MaintenancePlanningPlant,
         key  a.CompanyCode             ,
         key  a.CostCenter              ,
        // SELECTION  
         key  a.Equipment               ,
         
         key  b.StorageLocation          ,
         key  b.Reservation             ,
         key  b.ReservationItem         ,         
         key  b.Material,
         key  b.Plant                   ,
           a.EquipmentName           ,
           a.FunctionalLocation      ,
           a.MaintenanceActivityType ,
           a.ResponsibleCostCenter   ,
           a.PlantSection            ,
           b.CompanyCodeCurrency ,
           b.GoodsRecipientName      ,
           
          // SELECTION  
           b.PostingDate             ,
           
           b.MaterialDocumentItemText,
           @Aggregation.default: #SUM
           @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
           b.QuantityInEntryUnit     ,
           @Aggregation.default: #SUM
           @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
           b.TotalGoodsMvtAmtInCCCrcy,
           b.MaterialBaseUnit,
           b.EntryUnit
       //    dats_days_between( a.DueCalculationBaseDate, a.sydatum ) as daysarra 
}

      where  b.QuantityInEntryUnit <> 0
         and b.ReversedMaterialDocument = ''
         and b.GoodsMovementIsCancelled = ''
         and b.GoodsMovementType = '261'
