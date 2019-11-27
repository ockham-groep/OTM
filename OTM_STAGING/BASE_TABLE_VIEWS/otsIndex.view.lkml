view: otsIndex {
  sql_table_name: OTM_STAGING.OTSINDEX ;;
  label: "Index"

  dimension: cardinality {
    type: number
    sql: ${TABLE}.CARDINALITY ;;
  }

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
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

  dimension: pages {
    type: number
    sql: ${TABLE}.PAGES ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${table_name} || ${index_name} ;;
  }

  dimension: run_id {
    type: number
    sql: ${TABLE}.RUNID ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMANAME ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLENAME ;;
  }

  measure: count {
    type: count
    drill_fields: [catalog_name, index_name, table_name, schema_name]
  }
}
