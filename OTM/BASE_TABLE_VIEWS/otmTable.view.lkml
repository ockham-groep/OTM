view: otmTable {
  sql_table_name: OTM.OTMTABLE ;;
  label: "Table"

  dimension: cardinality {
    type: number
    sql: ${TABLE}.CARDINALITY ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension_group: last_ts_mut {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.LASTTSMUT ;;
  }

  dimension: last_user_name {
    hidden: yes
    type: string
    sql: ${TABLE}.LASTUSERNAME ;;
  }

  dimension: memo_id {
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: org_object_name {
    type: string
    sql: ${TABLE}.ORGOBJECTNAME ;;
  }

  dimension: org_schema_id {
    type: number
    sql: ${TABLE}.ORGSCHEMAID ;;
  }

  dimension: pages {
    type: number
    sql: ${TABLE}.PAGES ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${table_name} || ${schema_id} ;;
  }

  dimension: ref_generation {
    type: string
    sql: ${TABLE}.REFGENERATION ;;
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.REMARKS ;;
  }

  dimension: schema_id {
    type: number
    sql: ${TABLE}.SCHEMAID ;;
  }

  dimension: self_referencing_column_name {
    type: string
    sql: ${TABLE}.SELFREFERENCINGCOLUMNNAME ;;
  }

  dimension: super_table_name {
    type: string
    sql: ${TABLE}.SUPERTABLENAME ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLENAME ;;
  }

  dimension: table_type {
    type: string
    sql: ${TABLE}.TABLETYPE ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    type: count
    drill_fields: [org_object_name, super_table_name, self_referencing_column_name, table_name, last_user_name]
  }
}
