connection: "flightstats"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: jomg_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: jomg_default_datagroup

explore: aircraft {

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

}
