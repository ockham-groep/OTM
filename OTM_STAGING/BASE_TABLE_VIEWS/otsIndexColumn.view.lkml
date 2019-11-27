view: otsIndexColumn {
  sql_table_name: OTM_STAGING.OTSINDEXCOLUMN ;;
  label: "Index column"

  dimension: asc_or_desc {
    type: string
    sql: ${TABLE}.ASCORDESC ;;
  }

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMNNAME ;;
  }

  dimension: index_name {
    type: string
    sql: ${TABLE}.INDEXNAME ;;
  }

  dimension: ordinal_position {
    type: number
    sql: ${TABLE}.ORDINALPOSITION ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${table_name} || ${index_name} || ${column_name} ;;
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
    drill_fields: [index_name, table_name, schema_name, catalog_name, column_name]
  }
}
