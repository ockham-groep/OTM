view: otsRun {
  sql_table_name: OTM_STAGING.OTSRUN ;;
  label: "Run"

  dimension: instance_id {
    type: number
    sql: ${TABLE}.INSTANCEID ;;
  }

  dimension: newest {
    type: yesno
    sql: ${run_id} = (SELECT MAX( r2.RUNID)
                        FROM OTM_STAGING.OTSRUN r2
                       WHERE INSTANCEID = ${instance_id});;
  }

  dimension: run_id {
    description: "Click for details of this run"
    primary_key: yes
    type: number
    sql: ${TABLE}.RUNID ;;
    link: {
      label: "Object counts"
      url: "/explore/OTM/Staging?fields=Staging.run_id,otsTable.count,otsPrimaryKey.count,otsForeignKey.count,otsIndex.count,otsFunction.count,otsProcedure.count&f[Staging.run_id]={{ value }}"
    }
    link: {
      label: "Inconsistencies"
      url: "/explore/OTM/Staging?fields=Staging.run_id,otsQcTableWoTableColumn.count,otsQcTableColumnWoTable.count,otsQcFKeyWoFKeyColumn.count,otsQcFKeyColumnWoFKey.count&f[Staging.run_id]={{ value }}"
    }
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
