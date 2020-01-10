view: otmConstraintTabCol {
  sql_table_name: OTM.OTMCONSTRAINTTABCOL ;;
  label: "Constraint Tab Col"

  dimension: column_name {
    type: string
    sql: ${TABLE}.COLUMNNAME ;;
  }

  dimension: constraint_name {
    hidden: yes
    type: string
    sql: ${TABLE}.CONSTRAINTNAME ;;
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
    sql: ${constraint_name} || ${table_name} || ${schema_id_constraint} || ${schema_id_table} ;;
  }

  dimension: schema_id_constraint {
    hidden: yes
    type: number
    sql: ${TABLE}.SCHEMAIDCONSTRAINT ;;
  }

  dimension: schema_id_table {
    type: number
    sql: ${TABLE}.SCHEMAIDTABLE ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLENAME ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    label: "# of constraint tab cols"
    type: count
    drill_fields: [schema_id_constraint, constraint_name, table_name, column_name]
  }
}
