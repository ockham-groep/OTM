view: otsRun {
  sql_table_name: OTM_STAGING.OTSRUN ;;
  label: "Run"

  dimension: run_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.RUNID ;;
  }

  dimension_group: ts_finish {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.TSFINISH ;;
  }

  dimension_group: ts_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.TSSTART ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
