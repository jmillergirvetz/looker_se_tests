connection: "spanner_monitoring"

include: "/views/*.view.lkml"
include: "/*.dashboard.lookml"


## The SPANNER_SYS Query Statistics tables Properties are found
## https://cloud.google.com/spanner/docs/introspection/query-statistics#cpu-by-query
## The most prominant properties to understand the relationships between these tables are listed below.
## The complete list is found in the link above
## The following tables track the queries with the highest CPU usage during a specific time period.
## For monitoring purposes, we want to focus attention on queries that consume the highest amount of resources because they are the most impactful performance and efficiencies.

## SPANNER_SYS.QUERY_STATS_TOP_MINUTE: Queries during 1 minute intervals
## SPANNER_SYS.QUERY_STATS_TOP_10MINUTE: Queries during 10 minute intervals
## SPANNER_SYS.QUERY_STATS_TOP_HOUR: Queries during 1 hour intervals
## These tables have the following properties:

## Each table contains data for non-overlapping time intervals of the length the table name specifies.
## Intervals are based on clock times. 1 minute intervals end on the minute, 10 minute intervals end every 10 minutes starting on the hour, and 1 hour intervals end on the hour.

## For example, at 11:59:30 AM, the most recent intervals available to SQL queries are:
## 1 minute: 11:58:00–11:58:59 AM
## 10 minute: 11:40:00–11:49:59 AM
## 1 hour: 10:00:00–10:59:59 AM


explore: query_stats {
  always_filter: {
    filters: [query_stats.timeframe_selector: "NULL"]
  }

  join: total_cpu_facts {
    type: cross
    relationship: many_to_one
  }
}
