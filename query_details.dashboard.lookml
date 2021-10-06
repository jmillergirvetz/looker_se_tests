- dashboard: query_details
  title: Query Details
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Query Text
    name: Query Text
    model: spanner-monitoring
    explore: query_stats
    type: single_value
    fields: [query_stats.query_text]
    filters: {}
    sorts: [query_stats.query_text]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 0
    col: 0
    width: 24
    height: 5
  - title: Execution Count
    name: Execution Count
    model: spanner-monitoring
    explore: query_stats
    type: single_value
    fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds, query_stats.total_latency_seconds,
      query_stats.total_rows, query_stats.total_rows_scanned, query_stats.total_bytes]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields:
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 5
    col: 0
    width: 4
    height: 3
  - title: Avg Rows Returned
    name: Avg Rows Returned
    model: spanner-monitoring
    explore: query_stats
    type: single_value
    fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds, query_stats.total_latency_seconds,
      query_stats.total_rows, query_stats.total_rows_scanned, query_stats.total_bytes]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds,
      query_stats.total_latency_seconds]
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 5
    col: 12
    width: 4
    height: 3
  - title: Avg Latency (s)
    name: Avg Latency (s)
    model: spanner-monitoring
    explore: query_stats
    type: single_value
    fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds, query_stats.total_latency_seconds,
      query_stats.total_rows, query_stats.total_rows_scanned, query_stats.total_bytes]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds]
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 5
    col: 8
    width: 4
    height: 3
  - title: Avg Rows Scanned
    name: Avg Rows Scanned
    model: spanner-monitoring
    explore: query_stats
    type: single_value
    fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds, query_stats.total_latency_seconds,
      query_stats.total_rows, query_stats.total_rows_scanned, query_stats.total_bytes]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds,
      query_stats.total_latency_seconds, query_stats.total_rows]
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 5
    col: 16
    width: 4
    height: 3
  - title: Avg CPU (s)
    name: Avg CPU (s)
    model: spanner-monitoring
    explore: query_stats
    type: single_value
    fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds, query_stats.total_latency_seconds,
      query_stats.total_rows, query_stats.total_rows_scanned, query_stats.total_bytes]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [query_stats.total_execution_count]
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 5
    col: 4
    width: 4
    height: 3
  - title: Avg Bytes
    name: Avg Bytes
    model: spanner-monitoring
    explore: query_stats
    type: single_value
    fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds, query_stats.total_latency_seconds,
      query_stats.total_rows, query_stats.total_rows_scanned, query_stats.total_bytes]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [query_stats.total_execution_count, query_stats.total_cpu_seconds,
      query_stats.total_latency_seconds, query_stats.total_rows, query_stats.total_rows_scanned]
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 5
    col: 20
    width: 4
    height: 3
  - title: CPU Utilization
    name: CPU Utilization
    model: spanner-monitoring
    explore: query_stats
    type: looker_area
    fields: [query_stats.dynamic_time, query_stats.total_cpu_utilization]
    filters: {}
    sorts: [query_stats.dynamic_time]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: right, series: [{axisId: query_stats.total_cpu_utilization,
            id: query_stats.total_cpu_utilization, name: Total CPU Utilization}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    series_types: {}
    x_axis_label_rotation: 45
    defaults_version: 1
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 8
    col: 0
    width: 24
    height: 7
  - title: Rows Scanned / Rows Returned
    name: Rows Scanned / Rows Returned
    model: spanner-monitoring
    explore: query_stats
    type: looker_line
    fields: [query_stats.total_rows_scanned, query_stats.total_rows, query_stats.dynamic_time]
    filters: {}
    sorts: [query_stats.dynamic_time]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: !!null '', orientation: right, series: [{axisId: query_stats.total_rows_scanned,
            id: query_stats.total_rows_scanned, name: Total Rows Scanned}, {axisId: query_stats.total_rows,
            id: query_stats.total_rows, name: Total Rows}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    series_types: {}
    series_labels:
      query_stats.total_rows: Total Rows Returned
    x_axis_label_rotation: 45
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 22
    col: 0
    width: 24
    height: 7
  - title: Execution Count / Failed
    name: Execution Count / Failed
    model: spanner-monitoring
    explore: query_stats
    type: looker_line
    fields: [query_stats.dynamic_time, query_stats.total_execution_count, query_stats.total_all_failed_execution_count]
    filters: {}
    sorts: [query_stats.dynamic_time]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: !!null '', orientation: right, series: [{axisId: query_stats.count,
            id: query_stats.count, name: Query Stats}, {axisId: query_stats.total_all_failed_execution_count,
            id: query_stats.total_all_failed_execution_count, name: Total All Failed
              Execution Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    x_axis_label_rotation: 45
    defaults_version: 1
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 15
    col: 0
    width: 24
    height: 7
  filters:
  - name: Timeframe Selector
    title: Timeframe Selector
    type: field_filter
    default_value: 1hour
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_toggles
      display: inline
      options:
      - 1hour
      - 6hour
      - 1day
      - 7day
      - 'NULL'
    model: spanner-monitoring
    explore: query_stats
    listens_to_filters: []
    field: query_stats.timeframe_selector
  - name: Interval End Date
    title: Interval End Date
    type: field_filter
    default_value: 2021/07/22 to 2021/07/23
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: spanner-monitoring
    explore: query_stats
    listens_to_filters: []
    field: query_stats.interval_end_date
