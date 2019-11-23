view: otmDBMSVersion {
  sql_table_name: OTM.OTMDBMSVERSION ;;

  dimension: memo_id {
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.PRODUCTNAME ;;
  }

  dimension: product_version {
    type: string
    sql: ${TABLE}.PRODUCTVERSION ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
