view: otmSchema {
  label: "Schema"
  sql_table_name: OTM.OTMSCHEMA ;;

  dimension: catalog_name {
    hidden: yes
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.INSTANCEID ;;
  }

  dimension_group: last_ts_mut {
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
    sql: ${TABLE}.LASTTSMUT ;;
  }

  dimension: last_user_name {
    type: string
    sql: ${TABLE}.LASTUSERNAME ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}.MEMO ;;
  }

  dimension: memo_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: schema_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.SCHEMAID ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMANAME ;;
  }

  dimension: unique_id {
    hidden: yes
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    type: count
    drill_fields: [catalog_name, last_user_name, schema_name]
  }
}
