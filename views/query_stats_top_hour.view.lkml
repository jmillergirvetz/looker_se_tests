view: query_stats_top_hour {
  sql_table_name: SPANNER_SYS.QUERY_STATS_TOP_HOUR ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: interval_end {
    type: time
    timeframes: [
      raw,
      time,
      minute,
      minute5,
      hour,
      hour_of_day,
      date,
      day_of_month,
      day_of_week,
      day_of_week_index,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      year
    ]
    datatype: timestamp
    sql: ${TABLE}.INTERVAL_END ;;
  }

  dimension: query_text {
    type: string
    sql: ${TABLE}.TEXT ;;
  }

  dimension: query_text_truncated {
    type: string
    sql: LPAD(${query_text},50) ;;
  }

  dimension: text_truncated {
    type: string
    sql: ${TABLE}.TEXT_TRUNCATED ;;
  }

  dimension: text_fingerprint {
    type: number
    sql: ${TABLE}.TEXT_FINGERPRINT ;;
  }

  dimension: execution_count {
    type: number
    sql: ${TABLE}.EXECUTION_COUNT ;;
  }

  measure: total_execution_count {
    type: sum
    sql: ${execution_count} ;;
  }

  dimension: avg_latency_seconds {
    type: number
    sql: ${TABLE}.AVG_LATENCY_SECONDS ;;
  }

  measure: total_latency_seconds {
    type: sum
    value_format_name: decimal_2
    sql: ${avg_latency_seconds} ;;
  }

  dimension: avg_rows {
    type: number
    sql: ${TABLE}.AVG_ROWS ;;
  }

  measure: total_rows {
    type: sum
    sql: ${avg_rows} ;;
  }

  dimension: avg_bytes {
    type: number
    sql: ${TABLE}.AVG_BYTES ;;
  }

  measure: total_bytes {
    type: sum
    sql: ${avg_bytes} ;;
  }

  dimension: avg_rows_scanned {
    type: number
    sql: ${TABLE}.AVG_ROWS_SCANNED ;;
  }

  measure: total_rows_scanned {
    type: sum
    sql: ${avg_rows_scanned} ;;
  }

  dimension: avg_cpu_seconds {
    type: number
    sql: ${TABLE}.AVG_CPU_SECONDS ;;
  }

  measure: total_cpu_seconds {
    type: sum
    sql: ${avg_cpu_seconds} ;;
  }

  # cpu percentage's calculations is unclear

  dimension: total_cpu {
    type: number
    sql: ${execution_count} * ${avg_cpu_seconds} ;;
  }

  measure: total_cpu_utilization {
    type: sum
    value_format_name: decimal_2
    sql: ${total_cpu} ;;
  }

  dimension: cancelled_or_disconnected_execution_count {
    type: number
    sql: ${TABLE}.CANCELLED_OR_DISCONNECTED_EXECUTION_COUNT ;;
  }

  measure: total_cancelled_or_disconnected_execution_count {
    type: sum
    sql: ${cancelled_or_disconnected_execution_count} ;;
  }

  dimension: timed_out_execution_count {
    type: number
    sql: ${TABLE}.TIMED_OUT_EXECUTION_COUNT ;;
  }

  measure: total_timed_out_executiion_count {
    type: sum
    sql: ${timed_out_execution_count} ;;
  }

  dimension: all_failed_execution_count {
    type: number
    sql: ${TABLE}.ALL_FAILED_EXECUTION_COUNT ;;
  }

  measure: total_all_failed_execution_count {
    type: sum
    sql: ${all_failed_execution_count} ;;
  }

  dimension: all_failed_avg_latency_seconds {
    type: number
    sql: ${TABLE}.ALL_FAILED_AVG_LATENCY_SECONDS ;;
  }

  measure: total_all_failed_avg_latency_seconds {
    type: sum
    sql: ${all_failed_avg_latency_seconds} ;;
  }

  set: detail {
    fields: [
      interval_end_hour_of_day,
      query_text_truncated,
      text_truncated,
      text_fingerprint,
      execution_count,
      avg_latency_seconds,
      avg_rows,
      avg_bytes,
      avg_rows_scanned,
      avg_cpu_seconds,
      cancelled_or_disconnected_execution_count,
      timed_out_execution_count,
      all_failed_execution_count,
      all_failed_avg_latency_seconds
    ]
  }
}
