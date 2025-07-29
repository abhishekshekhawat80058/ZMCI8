CLASS zparts_life_cycle_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

"""""""""""""""""""""""""Gajendra Singh
    TYPES:BEGIN OF ty_final,
            maintenanceorder         TYPE i_maintenanceorderdex-maintenanceorder,
            maintenanceordertype     TYPE i_maintenanceorderdex-maintenanceordertype,
            maintenanceorderdesc     TYPE i_maintenanceorderdex-maintenanceorderdesc,
            scheduledbasicstartdate  TYPE i_maintenanceorderdex-scheduledbasicstartdate,
            mainworkcenter           TYPE i_maintenanceorderdex-mainworkcenter,
            mainworkcenterplant      TYPE i_maintenanceorderdex-mainworkcenterplant,
            maintenanceplanningplant TYPE i_maintenanceorderdex-maintenanceplanningplant,
            companycode              TYPE i_maintenanceorderdex-companycode,
            costcenter(10)           TYPE n, "i_maintenanceorderdex-costcenter,
            equipment                TYPE i_maintenanceorderdex-equipment,
            equipmentname            TYPE i_maintenanceorderdex-equipmentname,
            functionallocation       TYPE i_maintenanceorderdex-functionallocation,
            maintenanceactivitytype  TYPE i_maintenanceorderdex-maintenanceactivitytype,
            responsiblecostcenter    TYPE i_maintenanceorderdex-responsiblecostcenter,
            plantsection             TYPE i_maintenanceorderdex-plantsection,
            companycodecurrency      TYPE i_materialdocumentitem_2-companycodecurrency,
            plant                    TYPE i_materialdocumentitem_2-plant,
            storagelocation          TYPE i_materialdocumentitem_2-storagelocation,
            reservation              TYPE i_materialdocumentitem_2-reservation,
            reservationitem          TYPE i_materialdocumentitem_2-reservationitem,
            goodsrecipientname       TYPE i_materialdocumentitem_2-goodsrecipientname,
            postingdate              TYPE i_materialdocumentitem_2-postingdate,
            materialdocumentitemtext TYPE i_materialdocumentitem_2-materialdocumentitemtext,
            quantityinentryunit      TYPE i_materialdocumentitem_2-quantityinentryunit,
            EntryUnit                TYPE i_materialdocumentitem_2-materialbaseunit,
            totalgoodsmvtamtincccrcy TYPE i_materialdocumentitem_2-totalgoodsmvtamtincccrcy,
            material                 TYPE i_materialdocumentitem_2-material,
            MaterialGroup            TYPE I_Product-ProductGroup,
            MaterialDescription      TYPE I_ProductDescription_2-ProductDescription,
            TechnicalObjcetType      TYPE I_TechnicalObject-TechnicalObjectType,
            PurchaseOrder            TYPE I_PurchaseOrderItemAPI01-PurchaseOrder,
            PurchaseRequisition      TYPE I_PurchaseOrderItemAPI01-PurchaseRequisition,
            MaintOrdProcessSubPhaseCode    TYPE N LENGTH 4,

            life_cycle               TYPE i,
          END OF ty_final.

    DATA:it_final TYPE TABLE OF ty_final,
         wa_final TYPE ty_final.

    INTERFACES if_rap_query_provider.
*    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZPARTS_LIFE_CYCLE_CLASS IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
*  METHOD if_oo_adt_classrun~main.


    DATA:it_total TYPE TABLE OF zparts_life_cycle_cds1.

    DATA: lt_response TYPE TABLE OF zparts_life_cycle_cds1.
    DATA:lt_current_output TYPE TABLE OF zparts_life_cycle_cds1.
    DATA:wa1 TYPE zparts_life_cycle_cds1.

    DATA(lv_top)           = io_request->get_paging( )->get_page_size( ).
    DATA(lv_skip)          = io_request->get_paging( )->get_offset( ).
    DATA(lt_clause) = io_request->get_filter( )->get_as_sql_string( ).
    DATA(lt_filter)        = io_request->get_filter( )->get_as_sql_string( ).
    DATA(lt_fields)        = io_request->get_requested_elements( ).
    DATA(lt_sort)          = io_request->get_sort_elements( ).

    DATA(get_agge)         = io_request->get_aggregation(  ) .
    DATA(get_agge1)         = io_request->get_aggregation(  )->co_standard_aggregation_method .

    TRY.
        DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).
      CATCH cx_rap_query_filter_no_range INTO DATA(lx_no_sel_option).
    ENDTRY.

    DATA(mainworkcenter)             =  VALUE #( lt_filter_cond[ name   =  'MAINWORKCENTER'  ]-range OPTIONAL ).
    DATA(PostingDate)                =  VALUE #( lt_filter_cond[ name   =  'POSTINGDATE'  ]-range OPTIONAL ).
    DATA(Equipment)                  =  VALUE #( lt_filter_cond[ name   =  'EQUIPMENT'  ]-range OPTIONAL ).
    DATA(CostCenter)                 =  VALUE #( lt_filter_cond[ name   =  'COSTCENTER'  ]-range OPTIONAL ).
    DATA(MaintenancePlanningPlant)   =  VALUE #( lt_filter_cond[ name   =  'MAINTENANCEPLANNINGPLANT'  ]-range OPTIONAL ).
    DATA(MaintOrdProcessSubPhaseCode)  =  VALUE #( lt_filter_cond[ name =  'MAINTORDPROCESSSUBPHASECODE'  ]-range OPTIONAL ).
    DATA(PurchaseRequisition)        =  VALUE #( lt_filter_cond[ name   =  'PURCHASEREQUISITION'  ]-range OPTIONAL ).
    DATA(PurchaseOrder)              =  VALUE #( lt_filter_cond[ name   =  'PURCHASEORDER'  ]-range OPTIONAL ).
    DATA(TechnicalObjcetType)        =  VALUE #( lt_filter_cond[ name   =  'TECHNICALOBJCETTYPE'  ]-range OPTIONAL ).
    DATA(MaterialGroup)              =  VALUE #( lt_filter_cond[ name   =  'MATERIALGROUP'  ]-range OPTIONAL ).
    DATA(PlantSection)               =  VALUE #( lt_filter_cond[ name   =  'PLANTSECTION'  ]-range OPTIONAL ).
    DATA(Material)                   =  VALUE #( lt_filter_cond[ name   =  'MATERIAL'  ]-range OPTIONAL ).


    SELECT a~maintenanceorder        ,
           a~maintenanceordertype    ,
           a~maintenanceorderdesc    ,
           a~scheduledbasicstartdate ,
           a~mainworkcenter          ,
           a~mainworkcenterplant     ,
           a~maintenanceplanningplant,
           a~companycode             ,
           a~costcenter              ,
           a~equipment               ,
           a~equipmentname           ,
           a~functionallocation      ,
           a~maintenanceactivitytype ,
           a~responsiblecostcenter   ,
           a~plantsection            ,
           b~plant                   ,
           b~storagelocation          ,
           b~reservation             ,
           b~reservationitem         ,
           b~goodsrecipientname      ,
           b~postingdate             ,
           b~materialdocumentitemtext,
           b~quantityinentryunit     ,
           b~totalgoodsmvtamtincccrcy ,
           b~CompanyCodeCurrency,
           b~material,
           b~materialbaseunit  as EntryUnit,
           B~PurchaseOrder,
           a~MaintOrdProcessSubPhaseCode
     "      d~ProductGroup    as MaterialGroup,
     "     e~ProductDescription  as MaterialDescription,
     "      c~TechnicalObjectType    as TechnicalObjcetType

           FROM i_maintenanceorderdex AS a
           INNER JOIN i_materialdocumentitem_2 AS b ON ( b~orderid = a~maintenanceorder )
           WHERE quantityinentryunit <> 0
         AND B~ReversedMaterialDocument = ''
         AND B~goodsmovementiscancelled = ''
         AND ( B~GoodsMovementType = '261' OR B~GoodsMovementType = '101' )
         AND a~MainWorkCenter IN @mainworkcenter
         AND a~Equipment IN @Equipment
         AND b~PostingDate IN @PostingDate
         AND a~CostCenter IN @CostCenter
         AND a~MaintenancePlanningPlant IN @MaintenancePlanningPlant
         AND a~MaintOrdProcessSubPhaseCode IN @MaintOrdProcessSubPhaseCode
         AND b~PurchaseOrder IN @PurchaseOrder
         AND a~PlantSection IN @PlantSection
         AND b~Material IN @Material
           INTO TABLE @DATA(i_data).

data : v_index TYPE sy-tabix.

    SORT i_data BY equipment material postingdate.

    LOOP AT i_data INTO DATA(w_data).
      MOVE-CORRESPONDING w_data TO wa_final.
   SELECT SINGLE PurchaseRequisition FROM I_PurchaseOrderItemAPI01 WHERE PurchaseOrder = @w_data-PurchaseOrder AND PurchaseRequisition IN @PurchaseRequisition INTO @data(PR).
   wa_final-purchaserequisition = PR.
   SELECT SINGLE ProductGroup FROM I_Product WHERE Product = @w_data-Material AND ProductGroup IN @MaterialGroup INTO @data(product).
   SELECT SINGLE ProductDescription FROM  I_ProductDescription_2 WHERE Product = @w_data-Material AND Language = 'E' INTO @data(productDesc).
   SELECT SINGLE TechnicalObjectType FROM I_TechnicalObject WHERE Equipment = @w_data-Equipment  AND TechnicalObjectType IN @TechnicalObjcetType INTO @DATA(TchnicalObj).
   wa_final-materialgroup = product.
   wa_final-materialdescription = productdesc.
   wa_final-technicalobjcettype = tchnicalobj.

    v_index = sy-tabix - 1.

     IF v_index > 0.
      READ TABLE i_data INTO DATA(w_data1) INDEX sy-tabix - 1.
      IF  sy-subrc = 0 AND w_data-material = w_data1-material AND w_data-equipment = w_data1-equipment.
        wa_final-life_cycle =  w_data-postingdate -  w_data1-postingdate.
      ENDIF.
      ENDIF.
    wa_final-material         =  |{  w_data-Material  ALPHA = out }|.
    wa_final-equipment        =  |{  w_data-Equipment  ALPHA = out }|.
    wa_final-maintenanceorder =  |{  w_data-maintenanceorder  ALPHA = out }|.
    if w_data-entryunit = 'ST'.
    wa_final-entryunit = 'PC'.
    ENDIF.
      APPEND wa_final TO it_final.
      CLEAR : wa_final,product,productDesc,TchnicalObj,PR.
    ENDLOOP.

*    ******************************  for total ********************************
           SELECT a~*
              FROM @it_final  AS a
                INTO CORRESPONDING FIELDS OF TABLE  @it_total.


      IF io_request->is_data_requested( ).
**paging
      DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
      DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
      DATA(lv_max_rows) = COND #( WHEN lv_page_size = if_rap_query_paging=>page_size_unlimited
                                  THEN 0 ELSE lv_page_size ).
**sorting
      DATA(sort_elements) = io_request->get_sort_elements( ).
      DATA(lt_sort_criteria) = VALUE string_table( FOR sort_element IN sort_elements
                                                 ( sort_element-element_name && COND #( WHEN sort_element-descending = abap_true THEN ` descending`
                                                                                                                          ELSE ` ascending` ) ) ).
       data  lv_sort_string  TYPE string.
      lv_sort_string  = COND #( WHEN lt_sort_criteria IS INITIAL THEN '                                   '
                                                                       ELSE concat_lines_of( table = lt_sort_criteria sep = `, ` ) ).
**requested elements
      DATA(lt_req_elements) = io_request->get_requested_elements( ).
**aggregate
      DATA(lt_aggr_element) = io_request->get_aggregation( )->get_aggregated_elements( ).

      IF lt_aggr_element IS NOT INITIAL.
        LOOP AT lt_aggr_element ASSIGNING FIELD-SYMBOL(<fs_aggr_element>).
          DELETE lt_req_elements WHERE table_line = <fs_aggr_element>-result_element.
          DATA(lv_aggregation) = |{ <fs_aggr_element>-aggregation_method }( { <fs_aggr_element>-input_element } ) as { <fs_aggr_element>-result_element }|.
          APPEND lv_aggregation TO lt_req_elements.
        ENDLOOP.
      ENDIF.
      DATA(lv_req_elements)  = concat_lines_of( table = lt_req_elements sep = `, ` ).
****grouping
      DATA(lt_grouped_element) = io_request->get_aggregation( )->get_grouped_elements( ).
      DATA(lv_grouping) = concat_lines_of(  table = lt_grouped_element sep = `, ` ).



       IF lv_sort_string IS INITIAL .

  SELECT (lv_req_elements) FROM    @it_total AS a
                          WHERE (lt_clause)
                          GROUP BY (lv_grouping)
*                                       ORDER BY (lv_sort_string)
                               INTO CORRESPONDING FIELDS OF TABLE @lt_current_output
*                                        OFFSET @lv_offset
                               UP TO @lv_max_rows ROWS.

      ELSE.

  SELECT (lv_req_elements) FROM    @it_total AS a
                            WHERE (lt_clause)                         GROUP BY (lv_grouping)
                                           ORDER BY (lv_sort_string)
                              INTO CORRESPONDING FIELDS OF TABLE @lt_current_output
                                            OFFSET @lv_offset
                              UP TO @lv_max_rows ROWS.

    ENDIF .
    ENDIF .

    TRY .
      io_response->set_total_number_of_records( lines( lt_current_output ) ).
        io_response->set_data( lt_current_output ).

      CATCH cx_root INTO DATA(lv_exception).
        DATA(lv_exception_message) = cl_message_helper=>get_latest_t100_exception( lv_exception )->if_message~get_longtext( ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
