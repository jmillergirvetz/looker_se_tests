view: mq_tenant_mq {
  derived_table: {
    sql: SELECT DISTINCT carrier AS airlines
      , 1 AS survey_id
      , TO_DATE('01/01/2018', 'DD/MM/YYYY') AS q_date_type
      , 'check_1' AS q_check_box_type
      , 'drop_down_1' AS q_drop_down
      , 'tenant_id_1' AS tenant_id
FROM flights
WHERE carrier='MQ'
UNION ALL
SELECT DISTINCT carrier AS airlines
      , 1 AS survey_id
      , TO_DATE('01/02/2018', 'DD/MM/YYYY') AS q_date_type
      , 'check_1' AS q_check_box_type
      , 'drop_down_1' AS q_drop_down
      , 'tenant_id_1' AS tenant_id
FROM flights
WHERE carrier='MQ'
UNION ALL
SELECT DISTINCT carrier AS airlines
      , 1 AS survey_id
      , TO_DATE('01/03/2018', 'DD/MM/YYYY') AS q_date_type
      , 'check_1' AS q_check_box_type
      , 'drop_down_1' AS q_drop_down
      , 'tenant_id_1' AS tenant_id
FROM flights
WHERE carrier='MQ'
UNION ALL
SELECT DISTINCT carrier AS airlines
      , 2 AS survey_id
      , TO_DATE('01/01/2018', 'DD/MM/YYYY') AS q_date_type
      , 'check_2' AS q_check_box_type
      , 'drop_down_2' AS q_drop_down
      , 'tenant_id_2' AS tenant_id
FROM flights
WHERE carrier='MQ'
UNION ALL
SELECT DISTINCT carrier AS airlines
      , 2 AS survey_id
      , TO_DATE('01/02/2018', 'DD/MM/YYYY') AS q_date_type
      , 'check_2' AS q_check_box_type
      , 'drop_down_2' AS q_drop_down
      , 'tenant_id_2' AS tenant_id
FROM flights
WHERE carrier='MQ'
UNION ALL
SELECT DISTINCT carrier AS airlines
      , 2 AS survey_id
      , TO_DATE('01/03/2018', 'DD/MM/YYYY') AS q_date_type
      , 'check_2' AS q_check_box_type
      , 'drop_down_2' AS q_drop_down
      , 'tenant_id_2' AS tenant_id
FROM flights
WHERE carrier='MQ'
UNION ALL
SELECT DISTINCT carrier AS airlines
      , 3 AS survey_id
      , TO_DATE('01/01/2018', 'DD/MM/YYYY') AS q_date_type
      , 'check_3' AS q_check_box_type
      , 'drop_down_3' AS q_drop_down
      , 'tenant_id_3' AS tenant_id
FROM flights
WHERE carrier='MQ'
UNION ALL
SELECT DISTINCT carrier AS airlines
      , 3 AS survey_id
      , TO_DATE('01/02/2018', 'DD/MM/YYYY') AS q_date_type
      , 'check_3' AS q_check_box_type
      , 'drop_down_3' AS q_drop_down
      , 'tenant_id_3' AS tenant_id
FROM flights
WHERE carrier='MQ'
UNION ALL
SELECT DISTINCT carrier AS airlines
      , 3 AS survey_id
      , TO_DATE('01/03/2018', 'DD/MM/YYYY') AS q_date_type
      , 'check_3' AS q_check_box_type
      , 'drop_down_3' AS q_drop_down
      , 'tenant_id_3' AS tenant_id
FROM flights
WHERE carrier='MQ'
 ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: airlines {
    type: string
    sql: ${TABLE}.airlines ;;
  }

  dimension: survey_id {
    type: number
    sql: ${TABLE}.survey_id ;;
  }

  dimension: q_date_type {
    type: date
    sql: ${TABLE}.q_date_type ;;
  }

  dimension: q_check_box_type {
    type: string
    sql: ${TABLE}.q_check_box_type ;;
  }

  dimension: q_drop_down {
    type: string
    sql: ${TABLE}.q_drop_down ;;
  }

  dimension: tenant_id {
    type: string
    sql: ${TABLE}.tenant_id ;;
  }

  set: detail {
    fields: [
      airlines,
      survey_id,
      q_date_type,
      q_check_box_type,
      q_drop_down,
      tenant_id
    ]
  }
}
