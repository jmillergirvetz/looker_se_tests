view: order_items {
  sql_table_name: public.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

#   dimension: days_from_created {
#     type: number
#     sql: DATEDIFF ;;
#   }

  dimension_group: time_from_created {
    type: duration
    intervals: [day, week]
    sql_start: ${created_raw} ;;
    sql_end: GETDATE() ;;
  }

  dimension: is_0_to_30_days {
    type: yesno
    sql: ${days_time_from_created} < 31 ;;
  }

  measure: sum_sales_price_processing {
    type: sum
    sql: ${sale_price} ;;
    filters: [status: "Processing", is_0_to_30_days: "Yes"]
  }


  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price*0.96 ;;
  }

  measure: sum_sale_price {
    label: "Total Sales Price"
    type: sum
#     drill_fields: [detail*]
    value_format_name: usd_0
    sql: ${sale_price} ;;
  }

#   parameter: test {
#     type: number
#     allowed_value: {
#       label: "Four"
#       value: "4"
#     }
#     allowed_value: {
#       label: "Three"
#       value: "3"
#     }
#   }
#
#   dimension: four_or_three {
#     type: number
#     sql: {% parameter test %} ;;
#   }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      inventory_items.id,
      inventory_items.product_name,
      users.id,
      users.last_name,
      users.first_name
    ]
  }
}
