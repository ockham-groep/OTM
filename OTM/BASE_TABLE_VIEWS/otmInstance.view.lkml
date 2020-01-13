view: otmInstance {
  sql_table_name: OTM.OTMINSTANCE ;;
  label: "Instance"

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: instance_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.INSTANCEID ;;
    link: {
      label: "Intake"
      url: "/explore/OTM/Intake?fields=otmProject.project_name,otmSystem.system_name,otmStack.stack_name,otmInstance.instance_id,otmInstance.instance_name,otmDBMS.product_name&f[otmInstance.instance_id]={{ instance_id._value }}"
    }
    link: {
      label: "Structures"
      url: "/explore/OTM/Structure?fields=otmInstance.instance_id,otmInstance.instance_name,otmCatalog.catalog_name, otmSchema.schema_name&f[otmInstance.instance_id]={{ instance_id._value }}"
    }
  }

  dimension: instance_name {
    type: string
    sql: ${TABLE}.INSTANCENAME ;;
    link: {
      label: "Intake"
      url: "/explore/OTM/Intake?fields=otmProject.project_name,otmSystem.system_name,otmStack.stack_name,otmInstance.instance_id,otmInstance.instance_name,otmDBMS.product_name&f[otmInstance.instance_id]={{ instance_id._value }}"
    }
    link: {
      label: "Structures"
      url: "/explore/OTM/Structure?fields=otmInstance.instance_id,otmInstance.instance_name,otmCatalog.catalog_name, otmSchema.schema_name&f[otmInstance.instance_id]={{ instance_id._value }}"
    }
  }

  dimension: long_instance_name {
    label: "Instance name (long)"
    type: string
    sql: ${instance_id} || ' : ' || ${instance_name} || ' (' || ${system_name} || ' / ' || ${stack_name} || ')' ;;
    link: {
      label: "Intake"
      url: "/explore/OTM/Intake?fields=otmProject.project_name,otmSystem.system_name,otmStack.stack_name,otmInstance.instance_id,otmInstance.instance_name,otmDBMS.product_name&f[otmInstance.instance_id]={{ instance_id._value }}"
    }
    link: {
      label: "Structures"
      url: "/explore/OTM/Structure?fields=otmInstance.instance_id,otmInstance.instance_name,otmCatalog.catalog_name, otmSchema.schema_name&f[otmInstance.instance_id]={{ instance_id._value }}"
    }
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
      url: "/explore/OTM/Intake?fields=otmInstance.instance_id,otmInstance.instance_name,otmDBMS.product_name,otmDBMSEdition.product_edition,otmDBMSVersion.product_version&f[otmInstance.instance_id]={{ instance_id._value }}"
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
    label: "# of instances"
    type: count
    drill_fields: [system_name, stack_name, instance_id, instance_name, product_name]
  }
}
