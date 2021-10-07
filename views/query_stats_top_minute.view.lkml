view: query_stats_top_minute {
  sql_table_name: SPANNER_SYS.QUERY_STATS_TOP_MINUTE ;;

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
}
