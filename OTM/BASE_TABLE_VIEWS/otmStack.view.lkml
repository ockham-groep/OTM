view: otmStack {
  sql_table_name: OTM.OTMSTACK ;;
  label: "Stack"

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
    sql: ${TABLE}.LASTTSMUT ;;
  }

  dimension: last_user_name {
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

  dimension: pk {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${stack_name} || ${system_name} ;;
  }

  dimension: stack_name {
    type: string
    sql: ${TABLE}.STACKNAME ;;
  }

  dimension: system_name {
    hidden: yes
    type: string
    sql: ${TABLE}.SYSTEMNAME ;;
  }

  dimension: unique_id {
    hidden: yes
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    type: count
    drill_fields: [stack_name, last_user_name, system_name]
  }
}
