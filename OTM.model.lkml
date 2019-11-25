connection: "otm_dev"

include: "*.view.lkml"                       # include all views in this project
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
  from: otmDBMSX
  join: otmDBMSVersionX {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmDBMSVersionX.product_name} = ${Intake.product_name} ;;
  }
  join: otmDBMSEditionX {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmDBMSEditionX.product_name} = ${Intake.product_name} ;;
  }
  join: otmDBMSVersionEditionX {
    type: left_outer
    relationship: one_to_many
    sql_on: ${otmDBMSVersionEditionX.product_name} = ${otmDBMSVersionX.product_name}
        and ${otmDBMSVersionEditionX.product_version} = ${otmDBMSVersionEditionX.product_version}
        and ${otmDBMSVersionEditionX.product_name} = ${otmDBMSEditionX.product_name}
        and ${otmDBMSVersionEditionX.product_edition} = ${otmDBMSEditionX.product_edition} ;;
  }
}

#explore: Staging {
#  from: otsIndex
#}
