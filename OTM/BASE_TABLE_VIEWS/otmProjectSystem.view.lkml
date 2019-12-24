view: otmProjectSystem {
  sql_table_name: OTM.OTMPROJECTSYSTEM ;;
  label: "Project system"

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
    type: string
    sql: ${TABLE}.MEMO ;;
  }

  dimension: memo_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MEMOID ;;
  }

  dimension: pk {
    primary_key: yes
#    hidden: yes
    type: string
    sql: ${project_name} || ${system_name} ;;
  }

  dimension: project_name {
    hidden: yes
    type: string
    sql: ${TABLE}.PROJECTNAME ;;
  }

  dimension: system_name {
    hidden: yes
    type: string
    sql: ${TABLE}.SYSTEMNAME ;;
  }

  dimension: unique_id {
    hidden: yes
    type: number
    sql: ${TABLE}.UNIQUEID ;;
  }

  measure: count {
    type: count
    drill_fields: [last_user_name, system_name, project_name]
  }
}
