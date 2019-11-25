view: otmDBMSEditionX {
#  sql_table_name: OTM.OTMDBMSEDITION ;;
  label: "Edition"
  derived_table: {
    sql: select PRODUCTNAME
              , PRODUCTEDITION
              , MEMOTYPE
              , dbms_lob.substr( MEMO, 4000, 1 ) MEMO
           from OTM.OTMDBMSEDITION e
             left outer join OTM.OTMMEMO m
               on m.MEMOID = e.MEMOID ;;
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

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT( ${product_name}, ${product_edition}) ;;
  }

  dimension: product_edition {
    type: string
    sql: ${TABLE}.PRODUCTEDITION ;;
  }

  dimension: product_name {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTNAME ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
