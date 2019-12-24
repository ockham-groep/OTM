view: otmDBMSVersion {
  label: "Version"
  sql_table_name: OTM.OTMDBMSVERSION ;;

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
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
    sql: CONCAT( ${product_name}, ${product_version}) ;;
  }

  dimension: product_name {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTNAME ;;
  }

  dimension: product_version {
    type: string
    sql: ${TABLE}.PRODUCTVERSION ;;
  }

  dimension: unique_id {
    hidden: yes
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    label: "# of versions"
    type: count
    drill_fields: [product_name]
  }
}
