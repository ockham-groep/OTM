view: otmInstance {
  sql_table_name: OTM.OTMINSTANCE ;;

  dimension: instance_id {
    type: number
    sql: ${TABLE}.INSTANCEID ;;
  }

  dimension: instance_name {
    type: string
    sql: ${TABLE}.INSTANCENAME ;;
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

  dimension: product_edition {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTEDITION ;;
  }

  dimension: product_name {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTNAME ;;
  }

  dimension: product_version {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTVERSION ;;
  }

  dimension: stack_name {
#    hidden: yes
    type: string
    sql: ${TABLE}.STACKNAME ;;
  }

  dimension: system_name {
#    hidden: yes
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
    drill_fields: [product_name, instance_name, stack_name, last_user_name, system_name]
  }
}
