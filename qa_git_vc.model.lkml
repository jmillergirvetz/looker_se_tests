connection: "us_crime"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: qa_git_vc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: qa_git_vc_default_datagroup

explore: us_officer_eow {}
