connection: "spark3sql"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project



explore: items {
  join: orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${items.order_id} = ${orders.order_id};;
  }
}
