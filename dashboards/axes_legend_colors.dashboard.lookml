- dashboard: example_lookml_conversion
  title: Example LookML Conversion
  layout: newspaper
  elements:
  - title: Complete and Returned
    name: Complete and Returned
    model: thelook_jomg
    explore: order_items
    type: looker_column
    fields: [order_items.sum_sale_price, order_items.status, order_items.created_quarter]
    pivots: [order_items.status]
    fill_fields: [order_items.created_quarter]
    filters:
      order_items.created_date: 5 years
    sorts: [order_items.status, order_items.created_quarter desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_color: ["#000000"]
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date: order_items.created_year
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 5 years
    allow_multiple_values: true
    required: false
