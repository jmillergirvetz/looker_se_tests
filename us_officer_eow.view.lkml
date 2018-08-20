view: us_officer_eow {
  sql_table_name: public.us_officer_eow ;;

  dimension: canine {
    type: yesno
    sql: ${TABLE}.canine ;;
  }

  dimension: cause {
    type: string
    sql: ${TABLE}.cause ;;
  }

  dimension: day_of_week {
    type: string
    sql: ${TABLE}.day_of_week ;;
  }

  dimension: dept {
    type: string
    sql: ${TABLE}.dept ;;
  }

  dimension: dept_name {
    type: string
    sql: ${TABLE}.dept_name ;;
  }

  dimension_group: eow {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.eow ;;
  }

  dimension: person {
    type: string
    sql: ${TABLE}.person ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  measure: count {
    type: count
    drill_fields: [dept_name]
  }
}
