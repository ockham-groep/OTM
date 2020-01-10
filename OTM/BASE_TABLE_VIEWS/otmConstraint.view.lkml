view: otmConstraint {
  sql_table_name: OTM.OTMCONSTRAINT ;;
  label: "Constraint"

  dimension: constraint_expr {
    type: string
    sql: ${TABLE}.CONSTRAINTEXPR ;;
  }

  dimension: constraint_name {
    type: string
    sql: ${TABLE}.CONSTRAINTNAME ;;
  }

  dimension: constraint_type {
    type: string
    sql: ${TABLE}.CONSTRAINTTYPE ;;
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

  dimension: memo {
    type: number
    sql: ${TABLE}.MEMO ;;
  }

  dimension: memo_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${constraint_name} || ${schema_id} ;;
  }

  dimension: schema_id {
    hidden: yes
    type: number
    sql: ${TABLE}.SCHEMAID ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    label: "# of constraints"
    type: count
    drill_fields: [schema_id, constraint_name]
  }
}
