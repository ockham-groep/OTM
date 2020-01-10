view: otm_domain_value {
  sql_table_name: OTM.otmDomainValue ;;

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domainName ;;
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

  dimension: seq {
    type: number
    sql: ${TABLE}.seq ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.uniqueId ;;
  }

  measure: count {
    type: count
    drill_fields: [domain_name, last_user_name]
  }
}
