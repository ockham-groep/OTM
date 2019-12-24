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
    link: {
      label: "Index columns"
      url: "/explore/OTM/Staging?fields=otsIndexColumn.table_name,otsIndexColumn.index_name,otsIndexColumn.column_name&f[otsRun.run_id]={{ run_id._value }}&f[otsIndexColumn.catalog_name]={{ catalog_name._value }}&f[otsIndexColumn.schema_name]={{ schema_name._value }}&f[otsIndexColumn.table_name]={{ table_name._value }}&f[otsIndexColumn.index_name]={{ value }}"
    }
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
    link: {
      label: "Table columns"
      url: "/explore/OTM/Staging?fields=otsTableColumn.table_name,otsTableColumn.column_name&f[Staging.run_id]={{ run_id._value }}&f[otsTableColumn.catalog_name]={{ catalog_name._value }}&f[otsTableColumn.schema_name]={{ schema_name._value }}&f[otsTableColumn.table_name]={{ value }}"
    }
  }

  measure: count {
    label: "# of indices"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      catalog_name,
      schema_name,
      index_name
    ]
  }
}
