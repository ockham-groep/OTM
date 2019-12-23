view: otmCatalog {
  label: "Catalog"
sql_table_name: OTM.OTMCATALOG ;;

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

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
    sql: ${catalog_name} || ${instance_id} ;;
  }

  dimension: unique_id {
    hidden: yes
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    type: count
    drill_fields: [last_user_name, instance_name, catalog_name]
  }
}
