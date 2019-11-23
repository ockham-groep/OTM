view: otmMemo {
  sql_table_name: OTM.OTMMEMO ;;

  dimension: memo {
    type: string
    sql: ${TABLE}.MEMO ;;
  }

  dimension: memo_id {
    type: number
    sql: ${TABLE}.memoId ;;
  }

  dimension: memo_type {
    type: string
    sql: ${TABLE}.memoType ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
