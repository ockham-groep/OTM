view: otmDBMSX {
  label: "DBMS"
#  sql_table_name: OTM.OTMDBMS ;;
  derived_table: {
    sql: select PRODUCTNAME
              , MEMOTYPE
              , dbms_lob.substr( MEMO, 4000, 1 ) MEMO
           from OTM.OTMDBMS d
             left outer join OTM.OTMMEMO m
               on m.MEMOID = d.MEMOID ;;
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

  dimension: memo_type {
    type: string
    sql: ${TABLE}.MEMOTYPE ;;
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
