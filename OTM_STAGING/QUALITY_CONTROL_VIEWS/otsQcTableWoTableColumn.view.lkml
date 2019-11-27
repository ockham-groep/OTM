view: otsQcTableWoTableColumn {
  derived_table: {
    sql: SELECT RUNID
              , CATALOGNAME
              , SCHEMANAME
              , TABLENAME
           FROM OTM_STAGING.OTSTABLE tab
          WHERE NOT exists ( SELECT 1
                               FROM OTM_STAGING.OTSTABLECOLUMN tc
                              WHERE tc.RUNID = tab.RUNID
                                AND NVL( tc.CATALOG_NAME, 'leeg') = NVL( tab.CATALOG_NAME, 'leeg')
                                AND tc.SCHEMANAME = tab.SCHEMANAME
                                AND tc.TABLENAME = tab.TABLENAME) ;;
  }
  label: "QC Table without Table column"

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOGNAME ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${catalog_name} || ${schema_name} || ${table_name} ;;
  }

  dimension: run_id {
    type: number
    sql: ${TABLE}.RUNID ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMANAME ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLENAME ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      catalog_name,
      schema_name,
      table_name
    ]
  }
}
