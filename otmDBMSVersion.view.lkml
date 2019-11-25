view: otmDBMSVersionX {
  label: "Version"
#  sql_table_name: OTM.OTMDBMSVERSION ;;
  derived_table: {
    sql: select PRODUCTNAME
              , PRODUCTVERSION
              , MEMOTYPE
              , dbms_lob.substr( MEMO, 4000, 1 ) MEMO
           from OTM.OTMDBMSVERSION v
             left outer join OTM.OTMMEMO m
               on m.MEMOID = v.MEMOID ;;
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
    sql: CONCAT( ${product_name}, ${product_version}) ;;
  }

  dimension: product_name {
    hidden: yes
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
