view: otmTableColumn {
  sql_table_name: OTM.OTMTABLECOLUMN ;;
  label: "Column"

  dimension: char_octet_length {
    type: number
    sql: ${TABLE}.CHAROCTETLENGTH ;;
  }

  dimension: column_default {
    type: string
    sql: ${TABLE}.COLUMNDEFAULT ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMNNAME ;;
  }

  dimension: column_size {
    type: number
    sql: ${TABLE}.COLUMNSIZE ;;
  }

  dimension: decimal_digits {
    type: number
    sql: ${TABLE}.DECIMALDIGITS ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.DOMAINNAME ;;
  }

  dimension: ind_auto_increment {
    type: string
    sql: ${TABLE}.INDAUTOINCREMENT ;;
  }

  dimension: ind_generated_column {
    type: string
    sql: ${TABLE}.INDGENERATEDCOLUMN ;;
  }

  dimension: ind_nullable {
    type: string
    sql: ${TABLE}.INDNULLABLE ;;
  }

  dimension: ind_nullable_iso {
    type: string
    sql: ${TABLE}.INDNULLABLEISO ;;
  }

  dimension_group: last_ts_mut {
    hidden: yes
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
    sql: ${TABLE}.LASTTSMUT ;;
  }

  dimension: last_user_name {
    hidden: yes
    type: string
    sql: ${TABLE}.LASTUSERNAME ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}.MEMO ;;
  }

  dimension: memo_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MEMOID ;;
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
    hidden: yes
    type: string
    sql: ${table_name} || ${schema_id} || ${column_name} ;;
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.REMARKS ;;
  }

  dimension: schema_id {
    type: number
    sql: ${TABLE}.SCHEMAID ;;
  }

  dimension: source_data_type {
    type: number
    sql: ${TABLE}.SOURCEDATATYPE ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLENAME ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}.TYPENAME ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    label: "# of columns"
    type: count
    drill_fields: [last_user_name, domain_name, column_name, type_name, table_name]
  }
}
