view: otmIndexColumn {
  sql_table_name: OTM.OTMINDEXCOLUMN ;;
  label: "Index Column"

  dimension: asc_or_desc {
    type: string
    sql: ${TABLE}.ASCORDESC ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMNNAME ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: index_name {
    hidden: yes
    type: string
    sql: ${TABLE}.INDEXNAME ;;
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
    type: number
    sql: ${TABLE}.MEMO ;;
  }

  dimension: memo_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: ordinal_position {
    type: number
    sql: ${TABLE}.ORDINALPOSITION ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${table_name} || ${schema_id} || ${column_name} || ${index_name} ;;
  }

  dimension: schema_id {
    hidden: yes
    type: number
    sql: ${TABLE}.SCHEMAID ;;
  }

  dimension: table_name {
    hidden: yes
    type: string
    sql: ${TABLE}.TABLENAME ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    label: "# of index columns"
    type: count
    drill_fields: [schema_id, table_name, index_name, column_name]
  }
}
