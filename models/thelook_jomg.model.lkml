connection: "thelook_events"

label: "JOMG Enterprise Workshops"

include: "/views/*.view.lkml"

datagroup: new_day {
#   max_cache_age: "24 hours"
  sql_trigger: SELECT GETDATE() ;;
}

datagroup: infinite {
  sql_trigger: SELECT 1 ;;
}

explore: order_items {

  access_filter: {
    field: users.id
    user_attribute: user_id
  }

  persist_with: new_day

  label: "JOMG - Order Items"

  join: users {
    relationship: many_to_one
    type: left_outer
    sql_on: ${users.id} = ${order_items.user_id} ;;
  }

  join: inventory_items {
    relationship: many_to_one
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
  }

  join: products {
    relationship: many_to_one
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
  }

  join: distribution_centers {
    relationship: many_to_many
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
  }

}

# explore: new {
#   extends: [order_items]
#   label: "extended"
# }
