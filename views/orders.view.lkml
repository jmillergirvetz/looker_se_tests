
view: orders {
  derived_table: {
    sql: WITH
                ORDERS(order_id, num_items, sales_w_tax, name, dt) AS (
                  VALUES
                      (1, 1, 1.2, 'Danny', DATE('2022-01-01')),
                      (2, 2, 6.0, 'Teddy', DATE('2022-01-02')),
                      (3, 3, 7.2, 'Marry', DATE('2022-01-03'))
                ),
                ITEMS(item_id, item_name, order_id, price) AS (
                  VALUES
                      (1, 1, 'foo', 1.1),
                      (2, 2, 'bar', 2.2),
                      (3, 2, 'doo', 3.3),
                      (1, 3, 'pap', 1.1),
                      (2, 3, 'goo', 2.2),
                      (3, 3, 'dap', 3.3)

                )

            select * from ORDERS ;;
  }

  suggestions: no
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_sales_w_tax {
    type: sum
    sql: ${sales_w_tax} ;;
  }


  dimension: prime_key {
    primary_key: yes
    type: string
    sql: concat(${order_id}, ${name}) ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: num_items {
    type: number
    sql: ${TABLE}.num_items ;;
  }

  dimension: sales_w_tax {
    type: number
    sql: ${TABLE}.sales_w_tax ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: dt {
    type: date
    sql: ${TABLE}.dt ;;
  }

  set: detail {
    fields: [
        order_id,
  num_items,
  sales_w_tax,
  name,
  dt
    ]
  }
}
