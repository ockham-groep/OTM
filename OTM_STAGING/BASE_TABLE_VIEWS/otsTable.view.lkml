view: otsTable {
  sql_table_name: OTM_STAGING.OTSTABLE ;;
  label: "Table"

  dimension: cardinality {
    type: number
    sql: ${TABLE}.CARDINALITY ;;
  }

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: pages {
    type: number
    sql: ${TABLE}.PAGES ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${table_name} ;;
  }

  dimension: ref_generation {
    type: string
    sql: ${TABLE}.REGENERATION ;;
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.REMARKS ;;
  }

  dimension: run_id {
    type: number
    sql: ${TABLE}.RUNID ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMANAME ;;
  }

  dimension: self_referencing_column_name {
    type: string
    sql: ${TABLE}.SELFREFERENCINGCOLUMNNAME ;;
  }

  dimension: super_table_name {
    type: string
    sql: ${TABLE}.SUPERTABLENAME ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLENAME ;;
    link: {
      label: "Table columns"
      url: "/explore/OTM/Staging?fields=otsTableColumn.table_name,otsTableColumn.column_name&f[Staging.run_id]={{ run_id._value }}&f[otsTableColumn.catalog_name]={{ catalog_name._value }}&f[otsTableColumn.schema_name]={{ schema_name._value }}&f[otsTableColumn.table_name]={{ value }}"
    }
  }

  dimension: table_type {
    type: string
    sql: ${TABLE}.TABLETYPE ;;
  }

  dimension: type_catalog_name {
    type: string
    sql: ${TABLE}.TYPECATALOGNAME ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}.TYPENAME ;;
  }

  dimension: type_schema_name {
    type: string
    sql: ${TABLE}.TYPESCHEMANAME ;;
  }

  measure: count {
    label: "# of tables"
    type: count
    drill_fields: [table_list*]
  }

  # ----- Sets of fields for drilling ------
  set: table_list {
    fields: [
      run_id,
      catalog_name,
      schema_name,
      table_name,
      table_type,
      remarks
    ]
  }
}
