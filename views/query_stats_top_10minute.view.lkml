view: query_stats_top_10minute {
  sql_table_name: SPANNER_SYS.QUERY_STATS_TOP_10MINUTE ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: interval_end {
    type: string
    sql: ${TABLE}.INTERVAL_END ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.TEXT ;;
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

  dimension: avg_latency_seconds {
    type: number
    sql: ${TABLE}.AVG_LATENCY_SECONDS ;;
  }

  dimension: avg_rows {
    type: number
    sql: ${TABLE}.AVG_ROWS ;;
  }

  dimension: avg_bytes {
    type: number
    sql: ${TABLE}.AVG_BYTES ;;
  }

  dimension: avg_rows_scanned {
    type: number
    sql: ${TABLE}.AVG_ROWS_SCANNED ;;
  }

  dimension: avg_cpu_seconds {
    type: number
    sql: ${TABLE}.AVG_CPU_SECONDS ;;
  }

  dimension: cancelled_or_disconnected_execution_count {
    type: number
    sql: ${TABLE}.CANCELLED_OR_DISCONNECTED_EXECUTION_COUNT ;;
  }

  dimension: timed_out_execution_count {
    type: number
    sql: ${TABLE}.TIMED_OUT_EXECUTION_COUNT ;;
  }

  dimension: all_failed_execution_count {
    type: number
    sql: ${TABLE}.ALL_FAILED_EXECUTION_COUNT ;;
  }

  dimension: all_failed_avg_latency_seconds {
    type: number
    sql: ${TABLE}.ALL_FAILED_AVG_LATENCY_SECONDS ;;
  }

  set: detail {
    fields: [
      interval_end,
      text,
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
