view: otsPrimaryKey {
  sql_table_name: OTM_STAGING.OTSPRIMARYKEY ;;
  label: "Primary key"

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${table_name} || ${pk_name} ;;
  }

  dimension: pk_name {
    type: string
    sql: ${TABLE}.PKNAME ;;
    link: {
      label: "Pkey columns"
      url: "/explore/OTM/Staging?fields=otsPrimaryKeyColumn.table_name,otsPrimaryKeyColumn.pk_name,otsPrimaryKeyColumn.pk_column_name&f[Staging.run_id]={{ run_id._value }}&f[otsPrimaryKeyColumn.catalog_name]={{ catalog_name._value }}&f[otsPrimaryKeyColumn.schema_name]={{ schema_name._value }}&f[otsPrimaryKeyColumn.table_name]={{ table_name._value }}&f[otsPrimaryKeyColumn.pk_name]={{ value }}"
    }
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
    label: "# of primary keys"
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
      pk_name
    ]
  }
}
