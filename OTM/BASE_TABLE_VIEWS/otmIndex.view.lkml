view: otmIndex {
  sql_table_name: OTM.OTMINDEX ;;
  label: "Index"

  dimension: cardinality {
    type: number
    sql: ${TABLE}.CARDINALITY ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: filter_condition {
    type: string
    sql: ${TABLE}.FILTERCONDITION ;;
  }

  dimension: index_name {
    type: string
    sql: ${TABLE}.INDEXNAME ;;
  }

  dimension: index_qualifier {
    type: string
    sql: ${TABLE}.INDEXQUALIFIER ;;
  }

  dimension: index_type {
    type: string
    sql: ${TABLE}.INDEXTYPE ;;
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

  dimension: pages {
    type: number
    sql: ${TABLE}.PAGES ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${index_name} || ${table_name} || ${schema_id} ;;
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
    label: "# of indices"
    type: count
    drill_fields: [schema_id, table_name, index_name]
  }
}
