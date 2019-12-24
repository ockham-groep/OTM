view: otsQcFKeyColumnWoFKey {
  sql_table_name: OTM_STAGING.OTSQCFKEYCOLUMNWOFKEY ;;
  label: "QC FKey column without FKey"

  dimension: fk_catalog_name {
    type: string
    sql: ${TABLE}.FKCATALOGNAME ;;
  }

  dimension: fk_column_name {
    type: string
    sql: ${TABLE}.FKCOLUMNNAME ;;
  }

  dimension: fk_name {
    type: string
    sql: ${TABLE}.FKNAME ;;
  }

  dimension: fk_schema_name {
    type: string
    sql: ${TABLE}.FKSCHEMANAME ;;
  }

  dimension: fk_table_name {
    type: string
    sql: ${TABLE}.FKTABLENAME ;;
    link: {
      label: "Table columns"
      url: "/explore/OTM/Staging?fields=otsTableColumn.table_name,otsTableColumn.column_name&f[otsRun.run_id]={{ run_id._value }}&f[otsTableColumn.catalog_name]={{ fk_catalog_name._value }}&f[otsTableColumn.schema_name]={{ fk_schema_name._value }}&f[otsTableColumn.table_name]={{ value }}"
    }
  }

  dimension: key_seq {
    type: number
    sql: ${TABLE}.KEYSEQ ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${fk_catalog_name} || ${fk_schema_name} || ${fk_table_name} || ${fk_name} || ${fk_column_name} ;;
  }

  dimension: pk_column_name {
    type: string
    sql: ${TABLE}.PKCOLUMNNAME ;;
  }

  dimension: run_id {
    type: number
    sql: ${TABLE}.RUNID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      fk_catalog_name,
      fk_schema_name,
      fk_table_name,
      fk_name,
      fk_column_name,
      pk_column_name
    ]
  }
}
