- dashboard: spanner_monitoring
  title: Spanner Monitoring
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Total CPU Utilization (Per Query or Request Tag)
    name: Total CPU Utilization (Per Query or Request Tag)
    model: spanner-monitoring
    explore: query_stats
    type: looker_line
    fields: [query_stats.dynamic_time, query_stats.total_cpu_utilization, query_stats.text_fingerprint]
    pivots: [query_stats.text_fingerprint]
    filters: {}
    sorts: [query_stats.dynamic_time, query_stats.text_fingerprint]
    limit: 10
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: right, series: [{axisId: query_stats.total_cpu_utilization,
            id: false - query_stats.total_cpu_utilization, name: 'false'}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time
    series_types: {}
    x_axis_datetime_label: ''
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    defaults_version: 1
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 8
    col: 0
    width: 24
    height: 7
  - title: Total CPU Utilization (Per Query or Request Tag) Table
    name: Total CPU Utilization (Per Query or Request Tag) Table
    model: spanner-monitoring
    explore: query_stats
    type: looker_grid
    fields: [query_stats.total_cpu_utilization, query_stats.total_execution_count,
      query_stats.total_latency_seconds, query_stats.text_fingerprint]
    filters: {}
    sorts: [query_stats.total_cpu_utilization desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      query_stats.total_latency_seconds: Avg Latency (ms)
    series_column_widths: {}
    series_cell_visualizations:
      query_stats.total_cpu_utilization:
        is_active: true
        value_display: true
        palette:
          palette_id: dc65924d-47ce-45e6-a469-9977cbc6bd0e
          collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#462C9D",
        font_color: !!null '', color_application: {collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e,
          palette_id: b20fe57d-cb13-420f-815b-60e907a43148, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: [query_stats.total_latency_seconds]}]
    series_value_format:
      query_stats.total_cpu_utilization:
        name: percent_2
        decimals: '2'
        format_string: "#,##0.00%"
        label: Percent (2)
        label_prefix: Percent
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: right, series: [{axisId: query_stats.total_cpu_utilization,
            id: false - query_stats.total_cpu_utilization, name: 'false'}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    x_axis_datetime_label: ''
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    defaults_version: 1
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 15
    col: 0
    width: 24
    height: 8
  - title: Total CPU Utilization (All Queries)
    name: Total CPU Utilization (All Queries)
    model: spanner-monitoring
    explore: query_stats
    type: looker_area
    fields: [query_stats.dynamic_time, query_stats.total_cpu_utilization]
    filters: {}
    sorts: [query_stats.dynamic_time]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
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
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: right, series: [{axisId: query_stats.total_cpu_utilization,
            id: query_stats.total_cpu_utilization, name: Total CPU Percent}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    series_types: {}
    x_axis_datetime_label: "%M"
    x_axis_label_rotation: 45
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Timeframe Selector: query_stats.timeframe_selector
    row: 0
    col: 0
    width: 24
    height: 8
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
  - name: Custom Date Selector
    title: Custom Date Selector
    type: field_filter
    default_value: 2021/07/22 00:00 to 2021/07/22 00:00
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: spanner-monitoring
    explore: query_stats
    listens_to_filters: []
    field: query_stats.custom_date_selector
