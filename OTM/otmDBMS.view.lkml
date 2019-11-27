view: otmDBMS {
  label: "DBMS"
  sql_table_name: OTM.OTMDBMS ;;

  dimension: memo {
    type: string
    sql: ${TABLE}.MEMO ;;
  }

  dimension: memo_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: product_name {
    primary_key: yes
    type: string
    sql: ${TABLE}.PRODUCTNAME ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
