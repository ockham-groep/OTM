view: otsRun {
  sql_table_name: OTM_STAGING.OTSRUN ;;
  label: "Run"

  dimension: run_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.RUNID ;;
    link: {
      label: "Object counts"
      url: "/explore/OTM/Staging?fields=otsTable.count,otsPrimaryKey.count,otsForeignKey.count,otsIndex.count&f[otsRun.run_id]={{ value }}"
    }
    }

  dimension: newest {
    type: yesno
    sql: ${run_id} = (SELECT MAX( r2.RUNID) FROM OTM_STAGING.OTSRUN r2);;
#    sql: ${ts_start_raw} = (SELECT MAX( r2.TSSTART) FROM OTM_STAGING.OTSRUN r2);;
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
