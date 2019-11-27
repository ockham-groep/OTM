view: otmMemo {
  sql_table_name: OTM.OTMMEMO ;;

  dimension: memo {
    type: string
    sql: dbms_lob.substr( ${TABLE}.MEMO, 4000, 1 ) ;;
  }

  dimension: memo_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: memo_type {
    type: string
    sql: ${TABLE}.MEMOTYPE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
