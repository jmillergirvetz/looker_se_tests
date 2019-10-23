explore: inventory {}
view: inventory {
  sql_table_name: TPCDS_SF100TCL.INVENTORY ;;

  dimension: inv_date_sk {
    type: string
    sql: ${TABLE}."INV_DATE_SK" ;;
  }

  dimension: inv_item_sk {
    type: string
    sql: ${TABLE}."INV_ITEM_SK" ;;
  }

  dimension: inv_quantity_on_hand {
    type: string
    sql: ${TABLE}."INV_QUANTITY_ON_HAND" ;;
  }

  dimension: inv_warehouse_sk {
    type: string
    sql: ${TABLE}."INV_WAREHOUSE_SK" ;;
  }

  dimension: concat_string_suggest {
    type: string
    sql: ${inv_date_sk} || '-' || ${inv_item_sk} || '-' || ${inv_quantity_on_hand} || '-' || ${inv_warehouse_sk};;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
