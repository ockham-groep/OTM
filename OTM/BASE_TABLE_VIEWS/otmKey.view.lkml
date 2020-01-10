view: otmKey {
  sql_table_name: OTM.OTMKEY ;;
  label: "Key"

  dimension: delete_rule {
    type: string
    sql: ${TABLE}.DELETERULE ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: ind_deferrable {
    type: string
    sql: ${TABLE}.INDDEFERRABLE ;;
  }

  dimension: ind_initially_deferred {
    type: string
    sql: ${TABLE}.INDINITIALLYDEFERRED ;;
  }

  dimension: key_name {
    type: string
    sql: ${TABLE}.KEYNAME ;;
  }

  dimension: key_type {
    type: string
    sql: ${TABLE}.KEYTYPE ;;
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
    hidden: yes
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}.MEMO ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${table_name} || ${schema_id} || ${key_name} ;;
  }

  dimension: ref_key_name {
    type: string
    sql: ${TABLE}.REFKEYNAME ;;
  }

  dimension: ref_schema_id {
    type: string
    sql: ${TABLE}.REFSCHEMAID ;;
  }

  dimension: ref_table_name {
    type: string
    sql: ${TABLE}.REFTABLENAME ;;
  }

  dimension: schema_id {
    type: number
    sql: ${TABLE}.SCHEMAID ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLENAME ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  dimension: update_rule {
    type: string
    sql: ${TABLE}.UPDATERULE ;;
  }

  measure: count {
    label: "# of keys"
    type: count
    drill_fields: [schema_id, table_name, key_name]
  }
}
