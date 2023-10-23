
view: tle_orders {
  derived_table: {
    sql: SELECT * FROM `bigquery-public-data.thelook_ecommerce.orders` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_number_items {
    description: "take me to the moon"
    type: sum
    sql: ${num_of_item} ;;
  }

  measure: test_type_number {
    label: "Average Order Value"
    type: number
    sql: ${tle_order_items.sale_price} / ${sum_number_items} ;;
  }

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: returned_at {
    type: time
    sql: ${TABLE}.returned_at ;;
  }

  dimension_group: shipped_at {
    type: time
    sql: ${TABLE}.shipped_at ;;
  }

  dimension_group: delivered_at {
    type: time
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: num_of_item {
    type: number
    sql: ${TABLE}.num_of_item ;;
  }

  set: detail {
    fields: [
        order_id,
  user_id,
  status,
  gender,
  created_at_time,
  returned_at_time,
  shipped_at_time,
  delivered_at_time,
  num_of_item
    ]
  }
}
