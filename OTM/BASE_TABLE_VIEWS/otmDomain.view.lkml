view: otmDomain {
  sql_table_name: OTM.OTMDOMAIN ;;
  label: "Domain"

  dimension: column_default {
    type: string
    sql: ${TABLE}.COLUMNDEFAULT ;;
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

  dimension: ind_enumerate {
    type: string
    sql: ${TABLE}.INDENUMERATE ;;
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
    type: number
    sql: ${TABLE}.MEMO ;;
  }

  dimension: memo_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${domain_name} || ${schema_id} ;;
  }

  dimension: schema_id {
    hidden: yes
    type: number
    sql: ${TABLE}.SCHEMAID ;;
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
    label: "# of domains"
    type: count
    drill_fields: [schema_id, domain_name, type_name]
  }
}
