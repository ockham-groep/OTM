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
    link: {
      label: "Table columns"
      url: "/explore/OTM/Staging?fields=otsTableColumn.table_name,otsTableColumn.column_name&f[Staging.run_id]={{ run_id._value }}&f[otsTableColumn.catalog_name]={{ catalog_name._value }}&f[otsTableColumn.schema_name]={{ schema_name._value }}&f[otsTableColumn.table_name]={{ value }}"
    }
  }

  measure: count {
    label: "# of index columns"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      catalog_name,
      schema_name,
      index_name,
      column_name
    ]
  }
}
