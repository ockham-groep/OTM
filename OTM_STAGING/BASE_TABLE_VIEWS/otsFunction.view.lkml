view: otsFunction {
  sql_table_name: OTM_STAGING.OTSFUNCTION ;;
  label: "Function"

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: function_name {
    type: string
    sql: ${TABLE}.FUNCTIONNAME ;;
  }

  dimension: ind_table_result {
    type: string
    sql: ${TABLE}.INDTABLERESULT ;;
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.PACKAGENAME ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${function_name} ;;
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

  dimension: specific_name {
    type: string
    sql: ${TABLE}.SPECIFICNAME ;;
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
      function_name,
      package_name,
      specific_name
    ]
  }
}
