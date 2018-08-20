#### Connection will remain
# connection: "us_crime"


#### REQUIRED - includes base views to build base explore
include: "base.*.view.lkml"

#### REQUIRED - Update includes to only inlcude views and dashboard
include: "hp.*.view.lkml"
# include: "hp.*.dashboard.lookml"

#### REQUIRED - include base model file
include: "aircraft_base.model.lkml"

#### OPTIONAL - update datagroups to match tenants caching policies (example commented out below)
# datagroup: jomg_default_datagroup {
#   sql_trigger: SELECT MAX(id) FROM etl_log;;
# #   max_cache_age: "1 hour"
# }

#### REQUIRED - extend the base model
# connection: "default_name"
# include: "finance.model.lkml"
# explore: order_items_marketing {
#   extends: [order_items]
#   join: users {
#     type: left_outer
#     sql_on: ${orders.user_id} = ${users.id} ;;
#     relationship: many_to_one
#     }
#   }

explore: aircraft_hp {
  extends: [aircraft]
  view_name: aircraft
  join: tenant_hp {
    type: left_outer
    relationship: many_to_one
    sql_on: ${carriers.code} = ${tenant_hp.tenant_id} ;;
  }

}
