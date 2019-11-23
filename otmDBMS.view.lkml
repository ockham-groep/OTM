view: otmDBMS {
  sql_table_name: OTM.OTMDBMS ;;

  dimension: memo_id {
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.PRODUCTNAME ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
