view: otmSchema {
  label: "Schema"
  sql_table_name: OTM.OTMSCHEMA ;;

  dimension: catalog_name {
    hidden: yes
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.INSTANCEID ;;
  }

  dimension_group: last_ts_mut {
    hidden: yes
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
    hidden: yes
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
    link: {
      label: "Schema details"
      url: "/explore/OTM/Structure?fields=otmTable.count,otmKey.count,otmIndex.count,otmConstraint.count,otmDomain.count&f[otmInstance.instance_id]={{ instance_id._value }}&f[otmSchema.schema_name]={{ schema_name._value }}"
    }
    }

  dimension: unique_id {
    hidden: yes
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    label: "# of schemas"
    type: count
    drill_fields: [instance_id, catalog_name, schema_name]
  }
}
