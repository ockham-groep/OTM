view: otsForeignKey {
  sql_table_name: OTM_STAGING.OTSFOREIGNKEY ;;
  label: "Foreign key"

  dimension: delete_rule {
    type: string
    sql: ${TABLE}.DELETERULE ;;
  }

  dimension: fk_catalog_name {
    type: string
    sql: ${TABLE}.FKCATALOGNAME ;;
  }

  dimension: fk_name {
    type: string
    sql: ${TABLE}.FKNAME ;;
    link: {
      label: "Fkey columns"
      url: "/explore/OTM/Staging?fields=otsForeignKeyColumn.fk_table_name,otsForeignKeyColumn.fk_name,otsForeignKeyColumn.fk_column_name&f[Staging.run_id]={{ run_id._value }}&f[otsForeignKeyColumn.fk_catalog_name]={{ fk_catalog_name._value }}&f[otsForeignKeyColumn.fk_schema_name]={{ fk_schema_name._value }}&f[otsForeignKeyColumn.fk_table_name]={{ fk_table_name._value }}&f[otsForeignKeyColumn.fk_name]={{ value }}"
    }
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
      url: "/explore/OTM/Staging?fields=otsTableColumn.table_name,otsTableColumn.column_name&f[Staging.run_id]={{ run_id._value }}&f[otsTableColumn.catalog_name]={{ fk_catalog_name._value }}&f[otsTableColumn.schema_name]={{ fk_schema_name._value }}&f[otsTableColumn.table_name]={{ value }}"
    }
  }

  dimension: ind_deferrable {
    type: string
    sql: ${TABLE}.INDDEFERRABLE ;;
  }

  dimension: ind_initially_deferred {
    type: string
    sql: ${TABLE}.INDINITIALLYDEFERRED ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${fk_catalog_name} || ${fk_schema_name} || ${fk_table_name} || ${fk_name} ;;
  }

  dimension: pk_catalog_name {
    type: string
    sql: ${TABLE}.PKCATALOGNAME ;;
  }

  dimension: pk_name {
    type: string
    sql: ${TABLE}.PKNAME ;;
  }

  dimension: pk_schema_name {
    type: string
    sql: ${TABLE}.PKSCHEMANAME ;;
  }

  dimension: pk_table_name {
    type: string
    sql: ${TABLE}.PKTABLENAME ;;
    link: {
      label: "Table columns"
      url: "/explore/OTM/Staging?fields=otsTableColumn.table_name,otsTableColumn.column_name&f[Staging.run_id]={{ run_id._value }}&f[otsTableColumn.catalog_name]={{ pk_catalog_name._value }}&f[otsTableColumn.schema_name]={{ pk_schema_name._value }}&f[otsTableColumn.table_name]={{ value }}"
    }
    }

  dimension: run_id {
    type: number
    sql: ${TABLE}.RUNID ;;
  }

  dimension: update_rule {
    type: string
    sql: ${TABLE}.UPDATERULE ;;
  }

  measure: count {
    label: "# of foreign keys"
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
      pk_catalog_name,
      pk_schema_name,
      pk_table_name,
      pk_name
    ]
  }
}
