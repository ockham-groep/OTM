view: otmDBMSEdition {
  sql_table_name: OTM.OTMDBMSEDITION ;;

  dimension: MEMO_ID {
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: product_edition {
    type: string
    sql: ${TABLE}.PRODUCTEDITION ;;
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
