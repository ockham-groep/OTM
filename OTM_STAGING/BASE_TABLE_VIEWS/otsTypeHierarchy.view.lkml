view: otsTypeHierarchy {
  sql_table_name: OTM_STAGING.OTSTYPEHIERARCHY ;;
  label: "Type hierarchie"

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${type_name} || ${super_catalog_name} || ${super_schema_name} || ${super_type_name} ;;
  }

  dimension: run_id {
    type: number
    sql: ${TABLE}.RUNID ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMANAME ;;
  }

  dimension: super_catalog_name {
    type: string
    sql: ${TABLE}.SUPERCATALOGNAME ;;
  }

  dimension: super_schema_name {
    type: string
    sql: ${TABLE}.SUPERSCHEMANAME ;;
  }

  dimension: super_type_name {
    type: string
    sql: ${TABLE}.SUPERTYPENAME ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}.TYPENAME ;;
  }

  measure: count {
    label: "# of type hierarchies"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      catalog_name,
      schema_name,
      type_name,
      super_catalog_name,
      super_schema_name,
      super_type_name
    ]
  }
}
