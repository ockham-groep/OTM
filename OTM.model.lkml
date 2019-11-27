connection: "otm_dev"

#datagroup: OTM {
#  max_cache_age: "24 hours"
#}

include: "OTM/*.view.lkml"                       # include all views in this project
include: "OTM_STAGING/BASE_TABLE_VIEWS/*.view.lkml"
include: "OTM_STAGING/QUALITY_CONTROL_VIEWS/*.view.lkml"

# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

label: "1) Ockhams Treasure Map"

explore: Intake {
  from: otmDBMS
  join: otmDBMSVersion {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmDBMSVersion.product_name} = ${Intake.product_name} ;;
  }
  join: otmDBMSEdition {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmDBMSEdition.product_name} = ${Intake.product_name} ;;
  }
  join: otmDBMSVersionEdition {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmDBMSVersionEdition.product_name} = ${otmDBMSVersion.product_name}
        and ${otmDBMSVersionEdition.product_version} = ${otmDBMSVersion.product_version}
        and ${otmDBMSVersionEdition.product_name} = ${otmDBMSEdition.product_name}
        and ${otmDBMSVersionEdition.product_edition} = ${otmDBMSEdition.product_edition} ;;
  }
}

explore: Staging {
  from: otsRun
  join: otsTable {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTable.run_id} = ${Staging.run_id} ;;
  }
  join: otsTableColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTableColumn.run_id} = ${Staging.run_id} ;;
  }
  join: otsType {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsType.run_id} = ${Staging.run_id} ;;
  }
  join: otsTypeAttribute {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTypeAttribute.run_id} = ${Staging.run_id} ;;
  }
  join: otsTypeHierarchy {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTypeHierarchy.run_id} = ${Staging.run_id} ;;
  }
  join: otsPrimaryKey {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsPrimaryKey.run_id} = ${Staging.run_id} ;;
  }
  join: otsPrimaryKeyColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsPrimaryKeyColumn.run_id} = ${Staging.run_id} ;;
  }
  join: otsForeignKey {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsForeignKey.run_id} = ${Staging.run_id} ;;
  }
  join: otsForeignKeyColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsForeignKeyColumn.run_id} = ${Staging.run_id} ;;
  }
  join: otsIndex {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsIndex.run_id} = ${Staging.run_id} ;;
  }
  join: otsIndexColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsIndexColumn.run_id} = ${Staging.run_id} ;;
  }
  join: otsFunction {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsFunction.run_id} = ${Staging.run_id} ;;
  }
  join: otsFunctionColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsFunctionColumn.run_id} = ${Staging.run_id} ;;
  }
  join: otsProcedure {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsProcedure.run_id} = ${Staging.run_id} ;;
  }
  join: otsProcedureColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsProcedureColumn.run_id} = ${Staging.run_id} ;;
  }
  join: otsTablePrivilege {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTablePrivilege.run_id} = ${Staging.run_id} ;;
  }
  join: otsTableColumnPrivilege {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTableColumnPrivilege.run_id} = ${Staging.run_id} ;;
  }
  join: otsQcTableColumnWoTable {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${otsQcTableColumnWoTable.run_id} = ${Staging.run_id} ;;
  }
  join: otsQcTableWoTableColumn {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${otsQcTableWoTableColumn.run_id} = ${Staging.run_id} ;;
  }
}
