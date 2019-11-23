view: otmDBMSVersionEdition {
  sql_table_name: OTM.OTMDBMSVERSIONEDITION ;;

  dimension: memo_id {
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

  dimension: product_version {
    type: string
    sql: ${TABLE}.PRODUCTVERSION ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
