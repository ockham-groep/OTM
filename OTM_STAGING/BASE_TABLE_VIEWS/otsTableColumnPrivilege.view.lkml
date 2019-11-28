view: otsTableColumnPrivilege {
  sql_table_name: OTM_STAGING.OTSTABLECOLUMNPRIVILEGE ;;
  label: "Table column privilege"

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMNNAME ;;
  }

  dimension: grantee {
    type: string
    sql: ${TABLE}.GRANTEE ;;
  }

  dimension: grantor {
    type: string
    sql: ${TABLE}.GRANTOR ;;
  }

  dimension: ind_grantable {
    type: string
    sql: ${TABLE}.INDGRANTABLE ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${table_name} || ${column_name} || ${grantee} || ${privilege} ;;
  }

  dimension: privilege {
    type: string
    sql: ${TABLE}.PRIVILEGE ;;
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
    drill_fields: [column_name, catalog_name, schema_name, table_name]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      catalog_name,
      schema_name,
      table_name,
      column_name,
      grantee
    ]
  }
}
