connection: "otm_dev"

#datagroup: OTM {
#  max_cache_age: "24 hours"
#}

include: "OTM/BASE_TABLE_VIEWS/*.view.lkml"                       # include all views in this project
include: "OTM_STAGING/BASE_TABLE_VIEWS/*.view.lkml"
include: "OTM_STAGING/QUALITY_CHECK_VIEWS/*.view.lkml"

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
  view_name: otmInstance
  join: otmCatalog {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmCatalog.instance_id} = ${otmInstance.instance_id} ;;
  }
  join: otmSchema {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmSchema.instance_id} = ${otmInstance.instance_id}
        and NVL( ${otmSchema.catalog_name}, 'leeg') = NVL( ${otmCatalog.catalog_name}, 'leeg') ;;
  }
  join: otmStack {
    type: left_outer
    relationship: many_to_one
    sql_on: ${otmStack.system_name} = ${otmInstance.system_name}
        and ${otmStack.stack_name} = ${otmInstance.stack_name} ;;
  }
  join: otmSystem {
    type: inner
    relationship: many_to_one
    sql_on: ${otmSystem.system_name} = ${otmStack.system_name} ;;
  }
  join: otmProjectSystem {
    type: inner
    relationship: one_to_many
    sql_on: ${otmProjectSystem.system_name} = ${otmSystem.system_name} ;;
  }
  join: otmProject {
    type: inner
    relationship: many_to_one
    sql_on: ${otmProject.project_name} = ${otmProjectSystem.project_name} ;;
  }
  join: otmDBMSVersionEdition {
    type: inner
    relationship: many_to_one
    sql_on: ${otmDBMSVersionEdition.product_name} = ${otmInstance.product_name}
        and ${otmDBMSVersionEdition.product_version} = ${otmInstance.product_version}
        and ${otmDBMSVersionEdition.product_edition} = ${otmInstance.product_edition} ;;
  }
  join: otmDBMSVersion {
    type: inner
    relationship: many_to_one
    sql_on: ${otmDBMSVersion.product_name} = ${otmDBMSVersionEdition.product_name}
        and ${otmDBMSVersion.product_version} = ${otmDBMSVersionEdition.product_version} ;;
  }
  join: otmDBMSEdition {
    type: inner
    relationship: many_to_one
    sql_on: ${otmDBMSEdition.product_name} = ${otmDBMSVersion.product_name}
        and ${otmDBMSEdition.product_edition} =${otmDBMSVersionEdition.product_edition};;
  }
  join: otmDBMS {
    type: inner
    relationship: many_to_one
    sql_on: ${otmDBMS.product_name} = ${otmDBMSVersion.product_name}
        and ${otmDBMS.product_name} = ${otmDBMSEdition.product_name};;
  }
  join: otmUser {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmUser.instance_id} = ${otmInstance.instance_id} ;;
  }
  join: otmConnection {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmConnection.instance_id} = ${otmInstance.instance_id}
        and ${otmConnection.user_name_connection} = ${otmUser.otm_user_name} ;;
  }
}

explore: Staging {
  view_name: otsRun
  join: otsTable {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTable.run_id} = ${otsRun.run_id} ;;
  }
  join: otsTableColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTableColumn.run_id} = ${otsRun.run_id} ;;
  }
  join: otsType {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsType.run_id} = ${otsRun.run_id} ;;
  }
  join: otsTypeAttribute {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTypeAttribute.run_id} = ${otsRun.run_id} ;;
  }
  join: otsTypeHierarchy {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTypeHierarchy.run_id} = ${otsRun.run_id} ;;
  }
  join: otsPrimaryKey {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsPrimaryKey.run_id} = ${otsRun.run_id} ;;
  }
  join: otsPrimaryKeyColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsPrimaryKeyColumn.run_id} = ${otsRun.run_id} ;;
  }
  join: otsForeignKey {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsForeignKey.run_id} = ${otsRun.run_id} ;;
  }
  join: otsForeignKeyColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsForeignKeyColumn.run_id} = ${otsRun.run_id} ;;
  }
  join: otsIndex {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsIndex.run_id} = ${otsRun.run_id} ;;
  }
  join: otsIndexColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsIndexColumn.run_id} = ${otsRun.run_id} ;;
  }
  join: otsFunction {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsFunction.run_id} = ${otsRun.run_id} ;;
  }
  join: otsFunctionColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsFunctionColumn.run_id} = ${otsRun.run_id} ;;
  }
  join: otsProcedure {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsProcedure.run_id} = ${otsRun.run_id} ;;
  }
  join: otsProcedureColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsProcedureColumn.run_id} = ${otsRun.run_id} ;;
  }
  join: otsTablePrivilege {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTablePrivilege.run_id} = ${otsRun.run_id} ;;
  }
  join: otsTableColumnPrivilege {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otsTableColumnPrivilege.run_id} = ${otsRun.run_id} ;;
  }
  join: otsQcFKeyColumnWoFKey {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${otsQcFKeyColumnWoFKey.run_id} = ${otsRun.run_id} ;;
  }
  join: otsQcFKeyWoFKeyColumn {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${otsQcFKeyWoFKeyColumn.run_id} = ${otsRun.run_id} ;;
  }
  join: otsQcTableColumnWoTable {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${otsQcTableColumnWoTable.run_id} = ${otsRun.run_id} ;;
  }
  join: otsQcTableWoTableColumn {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${otsQcTableWoTableColumn.run_id} = ${otsRun.run_id} ;;
  }
}

explore: Structure {
  view_name: otmSchema
  join: otmCatalog {
    type: left_outer
    relationship: many_to_one
    sql_on: ${otmCatalog.catalog_name} = ${otmSchema.catalog_name} ;;
  }
  join: otmInstance {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmInstance.instance_id} = ${otmSchema.instance_id} ;;
  }
  join: otmTable {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmTable.schema_id} = ${otmSchema.schema_id} ;;
  }
  join: otmTableColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmTableColumn.table_name} = ${otmTable.table_name}
        and ${otmTableColumn.schema_id} = ${otmTable.schema_id} ;;
  }
  join: otmKey {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmKey.schema_id} = ${otmSchema.schema_id}
        and ${otmKey.table_name} = ${otmTable.table_name} ;;
  }
  join: otmKeyColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmKeyColumn.schema_id} = ${otmKey.schema_id}
        and ${otmKeyColumn.table_name} = ${otmKey.table_name}
        and ${otmKeyColumn.key_name} = ${otmKey.key_name} ;;
  }
  join: otmIndex {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmIndex.schema_id} = ${otmSchema.schema_id}
        and ${otmIndex.table_name} = ${otmTable.table_name} ;;
  }
  join: otmIndexColumn {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmIndexColumn.schema_id} = ${otmIndex.schema_id}
        and ${otmIndexColumn.table_name} = ${otmIndex.table_name}
        and ${otmIndexColumn.index_name} = ${otmIndex.index_name} ;;
  }
  join: otmConstraint {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmConstraint.schema_id} = ${otmSchema.schema_id} ;;
  }
  join: otmConstraintTabCol {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmConstraintTabCol.schema_id_constraint} = ${otmSchema.schema_id}
        and ${otmConstraintTabCol.constraint_name} = ${otmConstraint.constraint_name} ;;
  }
}
