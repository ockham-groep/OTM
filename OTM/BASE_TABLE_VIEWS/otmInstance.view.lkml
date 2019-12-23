view: otmInstance {
  sql_table_name: OTM.OTMINSTANCE ;;
  label: "Instance"

  dimension: instance_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.INSTANCEID ;;
    link: {
      label: "Intake"
      url: "/explore/OTM/Intake?fields=otmProject.project_name,otmSystem.system_name,otmStack.stack_name,Intake.instance_id,Intake.instance_name,otmDBMS.product_name&f[Intake.instance_id]={{ instance_id._value }}"
    }
  }

  dimension: instance_name {
    type: string
    sql: ${TABLE}.INSTANCENAME ;;
    link: {
      label: "Intake"
      url: "/explore/OTM/Intake?fields=otmProject.project_name,otmSystem.system_name,otmStack.stack_name,Intake.instance_id,Intake.instance_name,otmDBMS.product_name&f[Intake.instance_id]={{ instance_id._value }}"
    }
  }

  dimension_group: last_ts_mut {
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

  dimension: product_edition {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTEDITION ;;
  }

  dimension: product_name {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTNAME ;;
    link: {
      label: "Installation"
      url: "/explore/OTM/Intake?fields=Intake.instance_id,Intake.instance_name,otmDBMS.product_name,otmDBMSEdition.product_edition,otmDBMSVersion.product_version&f[Intake.instance_id]={{ instance_id._value }}"
    }
  }

  dimension: product_version {
    hidden: yes
    type: string
    sql: ${TABLE}.PRODUCTVERSION ;;
  }

  dimension: stack_name {
    hidden: yes
    type: string
    sql: ${TABLE}.STACKNAME ;;
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
    drill_fields: [system_name, stack_name, instance_id, instance_name, product_name]
  }
}
