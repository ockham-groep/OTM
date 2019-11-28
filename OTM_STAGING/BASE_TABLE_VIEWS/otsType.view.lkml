view: otsType {
  sql_table_name: OTM_STAGING.OTSTYPE ;;
  label: "Type"

  dimension: base_type {
    type: number
    sql: ${TABLE}.BASETYPE ;;
  }

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: class_name {
    type: string
    sql: ${TABLE}.CLASSNAME ;;
  }

  dimension: jdbc_type {
    type: number
    sql: ${TABLE}.JDBCTYPE ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${type_name} ;;
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

  dimension: type_name {
    type: string
    sql: ${TABLE}.TYPENAME ;;
  }

  measure: count {
    type: count
    drill_fields: [schema_name, type_name, class_name, catalog_name]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      catalog_name,
      schema_name,
      type_name,
      remarks
    ]
  }
}
