connection: "thelook"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project


explore: tle_order_items {
  join: tle_orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${tle_order_items.order_id} = ${tle_orders.order_id};;
  }
}
