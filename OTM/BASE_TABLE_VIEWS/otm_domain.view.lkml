view: otm_domain {
  sql_table_name: OTM.otmDomain ;;

  dimension: column_default {
    type: string
    sql: ${TABLE}.columnDefault ;;
  }

  dimension: column_size {
    type: number
    sql: ${TABLE}.columnSize ;;
  }

  dimension: decimal_digits {
    type: number
    sql: ${TABLE}.decimalDigits ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domainName ;;
  }

  dimension: ind_enumerate {
    type: string
    sql: ${TABLE}.indEnumerate ;;
  }

  dimension_group: last_ts_mut {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lastTsMut ;;
  }

  dimension: last_user_name {
    type: string
    sql: ${TABLE}.lastUserName ;;
  }

  dimension: memo_id {
    type: number
    sql: ${TABLE}.memoId ;;
  }

  dimension: schema_id {
    type: number
    sql: ${TABLE}.schemaId ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}.typeName ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.uniqueId ;;
  }

  measure: count {
    type: count
    drill_fields: [last_user_name, domain_name, type_name]
  }
}
