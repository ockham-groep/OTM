view: otsQcTableColumnWoTable {
  sql_table_name: OTM_STAGING.OTSQCTABLECOLUMNWOTABLE ;;
  label: "QC Table column without Table"

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMNNAME ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${table_name} || ${column_name} ;;
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
    drill_fields: [detail*]
  }

# ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      catalog_name,
      schema_name,
      table_name,
      column_name
    ]
  }
}
