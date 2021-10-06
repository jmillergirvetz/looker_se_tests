view: total_cpu_facts {
  derived_table: {
      explore_source: query_stats {
        column: total_cpu {
          field: query_stats.total_cpu
        }
      }
  }

  dimension: total_cpu {hidden:yes}

  measure: max_total_cpu_agg {
    hidden: yes
    type: max
    sql: ${total_cpu} ;;
  }
}


view: query_stats {
  sql_table_name:   {% if timeframe_selector._parameter_value == '1hour' %}
                        SPANNER_SYS.QUERY_STATS_TOP_MINUTE
                    {% elsif timeframe_selector._parameter_value == '6hour' %}
                        SPANNER_SYS.QUERY_STATS_TOP_10MINUTE
                    {% else %}
                        SPANNER_SYS.QUERY_STATS_TOP_HOUR
                    {% endif %}
                        ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: timeframe_selector {
    description: "Please either select a timeframe OR use the Custom Date Selector filter-field"
    type: unquoted
    allowed_value: {
      label: "1 Hour"
      value: "1hour"
    }
    allowed_value: {
      label: "6 Hours"
      value: "6hour"
    }
    allowed_value: {
      label: "1 Day"
      value: "1day"
    }
    allowed_value: {
      label: "7 Days"
      value: "7day"
    }
    allowed_value: {
      label: "Custom"
      value: "NULL"
    }
  }

  filter: custom_date_selector {
    type: date_time
  }

  dimension_group: interval_end {
    type: time
    timeframes: [
      raw,
      time,
      minute,
      minute5,
      minute10,
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

# This dynamic time column outputs as a string.
# Primary reason is to leverage out of the box Looker timeframes.
# Due to the string data type output, filling missing values in the Explore UI is unavailable.
# This can be updated to include specific casting and converting of the respective dynamic fields to a respective date or time data type.
# Final formatting would then be accomplished within the Explore UI when editing the viz settings.


  dimension: dynamic_time {
    type: string
    sql: {% if timeframe_selector._parameter_value == '1hour' %}
            ${interval_end_minute5}
         {% elsif timeframe_selector._parameter_value == '6hour' %}
            ${interval_end_minute10}
         {% elsif timeframe_selector._parameter_value == '1day'%}
            ${interval_end_hour}
         {% elsif timeframe_selector._parameter_value == 'NULL'%}
            CASE WHEN {% condition custom_date_selector %} ${interval_end_raw} {% endcondition %} THEN ${interval_end_date} ELSE NULL END
         {% else %}
            ${interval_end_date}
         {% endif %}
            ;;
  }

  dimension: is_past_hour {
    hidden: yes
    type: yesno
    sql: ${interval_end_raw} >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 HOUR) ;;
  }

  dimension: is_past_6hour {
    hidden: yes
    type: yesno
    sql: ${interval_end_raw} >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 6 HOUR) ;;
  }

  dimension: is_past_1day {
    hidden: yes
    type: yesno
    sql: ${interval_end_raw} >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY) ;;
  }

  dimension: is_past_7day {
    hidden: yes
    type: yesno
    sql: ${interval_end_raw} >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY) ;;
  }

  dimension: is_in_custom_date {
    hidden: yes
    type: yesno
    sql: {% condition query_stats.custom_date_selector %} ${interval_end_raw} {% endcondition %} ;;
  }

  dimension: query_text {
    label: "Query Log"
    type: string
    sql: ${TABLE}.TEXT ;;
  }

  dimension: query_text_truncated {
    label: "Query Log Truncated"
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

  # spanner doesn't support percentiles, so these would need to be calculated manually with the available sql support.
  # measure: total_latency_seconds_99_percentile {
  #   type: percentile
  #   percentile: 99
  #   sql: ${avg_latency_seconds} ;;
  # }

  # measure: total_latency_seconds_50_percentile {
  #   type: percentile
  #   percentile: 50
  #   sql: ${avg_latency_seconds} ;;
  # }

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
    value_format_name: decimal_4
    sql: ${avg_cpu_seconds} ;;
  }

  dimension: cpu_per_query {
    type: number
    sql: ${execution_count} * ${avg_cpu_seconds} ;;
  }

  measure: total_cpu {
    type: sum
    value_format_name: decimal_2
    sql: ${cpu_per_query} ;;
  }

  measure: total_cpu_utilization {
    type: number
    value_format_name: percent_2
    sql: ${total_cpu} / ${total_cpu_facts.max_total_cpu_agg} ;;
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

  measure: total_all_failed_execution_count {
    type: sum
    sql: ${all_failed_execution_count} ;;
  }

  dimension: all_failed_avg_latency_seconds {
    type: number
    sql: ${TABLE}.ALL_FAILED_AVG_LATENCY_SECONDS ;;
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
