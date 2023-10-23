view: items {
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
                (4, 3, 'pap', 1.1),
                (5, 3, 'goo', 2.2),
                (6, 3, 'dap', 3.3)

          )

      select * from ITEMS ;;
  }

  suggestions: no
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_name {
    type: number
    sql: ${TABLE}.item_name ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  set: detail {
    fields: [
        item_id,
  item_name,
  order_id,
  price
    ]
  }
}
