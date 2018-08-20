connection: "us_crime"

#### update include to only include the base views since model extensions will require base and tenant views
include: "base.*.view"

#### remove included dashboards since the base will "require" extension for each tenant
# # include all the dashboards
# include: "*.dashboard"


#### OPTIONAL - create a default datagroup or require creation/update per tenanat's model
datagroup: jomg_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: jomg_default_datagroup

#### base model

explore: aircraft {

#   access_filter: {
#     field: carriers.code
#     user_attribute: test_airline_code
#   }

  join: aircraft_models {
    type: inner
    relationship: many_to_one
    sql_on: ${aircraft.aircraft_model_code} = ${aircraft_models.aircraft_model_code} ;;
  }

  join: flights {
    type: left_outer
    relationship: one_to_many
    sql_on: ${aircraft.tail_num} = ${flights.tail_num} ;;
  }

  join: airports {
    type: inner
    relationship: one_to_many
    sql_on: ${flights.origin} = ${airports.code} ;;
  }

  join: carriers {
    type: inner
    relationship: many_to_one
    sql_on: ${flights.carrier} = ${carriers.code} ;;
  }

}
