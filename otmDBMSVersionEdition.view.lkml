view: otmDBMSVersionEditionX {
  label: "Installation"
#  sql_table_name: OTM.OTMDBMSVERSIONEDITION ;;
  derived_table: {
    sql: select PRODUCTNAME
              , PRODUCTVERSION
              , PRODUCTEDITION
              , MEMOTYPE
              , dbms_lob.substr( MEMO, 4000, 1 ) MEMO
           from OTM.OTMDBMSVERSIONEDITION p
             left outer join OTM.OTMMEMO m
               on m.MEMOID = p.MEMOID ;;
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
#    hidden: yes
    sql: CONCAT( CONCAT( ${product_name}, ${product_version}), ${product_edition}) ;;
  }

  dimension: product_edition {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTEDITION ;;
  }

  dimension: product_name {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTNAME ;;
  }

  dimension: product_version {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTVERSION ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
