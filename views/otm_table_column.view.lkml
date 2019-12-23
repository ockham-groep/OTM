view: otm_table_column {
  sql_table_name: OTM.otmTableColumn ;;

  dimension: char_octet_length {
    type: number
    sql: ${TABLE}.charOctetLength ;;
  }

  dimension: column_default {
    type: string
    sql: ${TABLE}.columnDefault ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.columnName ;;
  }

  dimension: column_size {
    type: number
    sql: ${TABLE}.columnSize ;;
  }

  dimension: decimal_digits {
    type: number
    sql: ${TABLE}.decimalDigits ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domainName ;;
  }

  dimension: ind_auto_increment {
    type: string
    sql: ${TABLE}.indAutoIncrement ;;
  }

  dimension: ind_generated_column {
    type: string
    sql: ${TABLE}.indGeneratedColumn ;;
  }

  dimension: ind_nullable {
    type: string
    sql: ${TABLE}.indNullable ;;
  }

  dimension: ind_nullable_iso {
    type: string
    sql: ${TABLE}.indNullableISO ;;
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

  dimension: numeric_precision_radix {
    type: number
    sql: ${TABLE}.numericPrecisionRadix ;;
  }

  dimension: ordinal_position {
    type: number
    sql: ${TABLE}.ordinalPosition ;;
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.remarks ;;
  }

  dimension: schema_id {
    type: number
    sql: ${TABLE}.schemaId ;;
  }

  dimension: source_data_type {
    type: number
    sql: ${TABLE}.sourceDataType ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.tableName ;;
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
    drill_fields: [last_user_name, domain_name, column_name, type_name, table_name]
  }
}
