view: otsQcFKeyWoFKeyColumn {
  derived_table: {
    sql: SELECT RUNID
              , FKCATALOGNAME
              , FKSCHEMANAME
              , FKTABLENAME
              , FKNAME
           FROM OTM_STAGING.OTSFOREIGNKEY fk
          WHERE NOT exists ( SELECT 1
                               FROM OTM_STAGING.OTSFOREIGNKEYCOLUMN fkc
                              WHERE fkc.RUNID = fk.RUNID
                                AND NVL( fkc.FKCATALOGNAME, 'leeg') = NVL( fk.FKCATALOGNAME, 'leeg')
                                AND fkc.FKSCHEMANAME = fk.FKSCHEMANAME
                                AND fkc.FKTABLENAME = fk.FKTABLENAME) ;;
  }
  label: "QC Table without Table column"

  dimension: fk_catalog_name {
    type: string
    sql: ${TABLE}.FKCATALOGNAME ;;
  }

  dimension: fk_name {
    type: string
    sql: ${TABLE}.FKNAME ;;
  }

  dimension: fk_schema_name {
    type: string
    sql: ${TABLE}.FKSCHEMANAME ;;
  }

  dimension: fk_table_name {
    type: string
    sql: ${TABLE}.FKTABLENAME ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${run_id} || ${fk_catalog_name} || ${fk_schema_name} || ${fk_table_name} || ${fk_name} ;;
    }

  dimension: run_id {
    type: number
    sql: ${TABLE}.RUNID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      run_id,
      fk_catalog_name,
      fk_schema_name,
      fk_table_name
    ]
  }
}
