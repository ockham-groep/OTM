view: otsTypeAttribute {
  sql_table_name: OTM_STAGING.OTSTYPEATTRIBUTE ;;
  label: "Type attribute"

  dimension: attribute_default {
    type: string
    sql: ${TABLE}.ATTRIBUTEDEFAULT ;;
  }

  dimension: attribute_name {
    type: string
    sql: ${TABLE}.ATTRIBUTENAME ;;
  }

  dimension: attribute_size {
    type: number
    sql: ${TABLE}.ATTRIBUTESIZE ;;
  }

  dimension: attribute_type_name {
    type: string
    sql: ${TABLE}.ATTRIBUTETYPENAME ;;
  }

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: char_octet_length {
    type: number
    sql: ${TABLE}.CHAROCTETLENGTH ;;
  }

  dimension: decimal_digits {
    type: number
    sql: ${TABLE}.DECIMALDIGITS ;;
  }

  dimension: ind_nullable {
    type: string
    sql: ${TABLE}.INDNULLABLE ;;
  }

  dimension: ind_nullable_iso {
    type: string
    sql: ${TABLE}.INDNULLABLEISO ;;
  }

  dimension: jdbc_type {
    type: number
    sql: ${TABLE}.JDBCTYPE ;;
  }

  dimension: numeric_precision_radix {
    type: number
    sql: ${TABLE}.NUMERICPRECISIONRADIX ;;
  }

  dimension: ordinal_position {
    type: number
    sql: ${TABLE}.ORDINALPOSITION ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${type_name} || ${attribute_name} ;;
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

  dimension: scope_catalog_name {
    type: string
    sql: ${TABLE}.SCOPECATALOGNAME ;;
  }

  dimension: scope_schema_name {
    type: string
    sql: ${TABLE}.SCOPESCHEMANAME ;;
  }

  dimension: scope_table_name {
    type: string
    sql: ${TABLE}.SCOPETABLENAME ;;
  }

  dimension: source_data_type {
    type: number
    sql: ${TABLE}.SOURCEDATATYPE ;;
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
      run_id,
      catalog_name,
      schema_name,
      type_name,
      attribute_name,
      scope_catalog_name,
      scope_schema_name,
      scope_table_name,
      attribute_type_name
    ]
  }
}
