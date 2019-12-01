view: otsPrimaryKeyColumn {
  sql_table_name: OTM_STAGING.OTSPRIMARYKEYCOLUMN ;;
  label: "Primary key column"

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMNNAME ;;
  }

  dimension: key_seq {
    type: number
    sql: ${TABLE}.KEYSEQ ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${table_name} || ${pk_name} || ${column_name};;
  }
  dimension: pk_name {
    type: string
    sql: ${TABLE}.PKNAME ;;
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
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      catalog_name,
      schema_name,
      table_name,
      pk_name,
      column_name
    ]
  }
}
