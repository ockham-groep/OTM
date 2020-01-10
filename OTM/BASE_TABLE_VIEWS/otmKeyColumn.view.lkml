view: otmKeyColumn {
  sql_table_name: OTM.OTMKEYCOLUMN ;;
  label: "Key Column"

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMNNAME ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: key_name {
    type: string
    sql: ${TABLE}.KEYNAME ;;
  }

  dimension: key_seq {
    type: number
    sql: ${TABLE}.KEYSEQ ;;
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

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${table_name} || ${schema_id} || ${column_name} || ${key_name} ;;
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
    drill_fields: [schema_id, table_name, key_name, column_name]
  }
}
