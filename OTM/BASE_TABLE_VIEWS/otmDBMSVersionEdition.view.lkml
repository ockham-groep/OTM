view: otmDBMSVersionEdition {
  label: "Installation"
  sql_table_name: OTM.OTMDBMSVERSIONEDITION ;;

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
    primary_key: yes
    hidden: yes
    sql: CONCAT( CONCAT( ${product_name}, ${product_version}), ${product_edition}) ;;
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

  dimension: unique_id {
    hidden: yes
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
