view: otmConnection {
  label: "Connection"
  sql_table_name: OTM.otmConnection ;;

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.INSTANCEID ;;
  }

  dimension: instance_name {
    hidden: yes
    type: string
    sql: ${TABLE}.INSTANCENAME ;;
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

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${instance_id}||${user_name_connection} ;;
  }

  dimension: unique_id {
    hidden: yes
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  dimension: user_name_connection {
    type: string
    sql: ${TABLE}.USERNAMECONNECTION ;;
  }

  measure: count {
    label: "# of connections"
    type: count
    drill_fields: [instance_name, last_user_name]
  }
}
