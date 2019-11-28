view: otsProcedure {
  sql_table_name: OTM_STAGING.OTSPROCEDURE ;;
  label: "Procedure"

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: ind_result {
    type: string
    sql: ${TABLE}.INDRESULT ;;
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.PACKAGENAME ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${procedure_name} ;;
  }

  dimension: procedure_name {
    type: string
    sql: ${TABLE}.PROCEDURENAME ;;
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
      procedure_name
    ]
  }
}
