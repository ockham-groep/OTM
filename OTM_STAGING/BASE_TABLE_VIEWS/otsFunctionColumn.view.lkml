view: otsFunctionColumn {
  sql_table_name: OTM_STAGING.OTSFUNCTIONCOLUMN ;;
  label: "Function column"

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: char_octet_length {
    type: number
    sql: ${TABLE}.CHAROCTETLENGTH ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMNNAME ;;
  }

  dimension: function_name {
    type: string
    sql: ${TABLE}.FUNCTIONNAME ;;
  }

  dimension: ind_in_parameter {
    type: string
    sql: ${TABLE}.INDINPARAMETER ;;
  }

  dimension: ind_nullable {
    type: string
    sql: ${TABLE}.INDNULLABLE ;;
  }

  dimension: ind_nullable_iso {
    type: string
    sql: ${TABLE}.INDNULLABLEISO ;;
  }

  dimension: ind_out_parameter {
    type: string
    sql: ${TABLE}.INDOUTPARAMETER ;;
  }

  dimension: ind_result_column {
    type: string
    sql: ${TABLE}.INDRESULTCOLUMN ;;
  }

  dimension: ind_return_value {
    type: string
    sql: ${TABLE}.INDRETURNVALUE ;;
  }

  dimension: jdbc_type {
    type: number
    sql: ${TABLE}.JDBCTYPE ;;
  }

  dimension: length {
    type: number
    sql: ${TABLE}.LENGTH ;;
  }

  dimension: ordinal_position {
    type: number
    sql: ${TABLE}.ORDINALPOSITION ;;
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.PACKAGENAME ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${function_name} || ${column_name} || ${ind_result_column} || ${ind_return_value} ;;
  }

  dimension: precision {
    type: number
    sql: ${TABLE}.PRECISION ;;
  }

  dimension: radix {
    type: number
    sql: ${TABLE}.RADIX ;;
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.REMARKS ;;
  }

  dimension: run_id {
    type: number
    sql: ${TABLE}.RUNID ;;
  }

  dimension: scale {
    type: number
    sql: ${TABLE}.SCALE ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMANAME ;;
  }

  dimension: specific_name {
    type: string
    sql: ${TABLE}.SPECIFICNAME ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}.TYPENAME ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      package_name,
      specific_name,
      type_name,
      column_name,
      function_name,
      schema_name,
      catalog_name
    ]
  }
}
