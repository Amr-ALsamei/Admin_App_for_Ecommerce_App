
import 'package:adminapp/Core/constant/imageAssest.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/View/widget/CardAdminhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    // AdminHomeControllerImp controller=Get.put(AdminHomeControllerImp());
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ListView(children: [
       GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,mainAxisExtent: 150
        ),
        children: [
          CardAdminHome(imge: AppImageAssets.users, title: "Categories",onClick: (){
            Get.toNamed(RoutesApp.categoriesview);
          },),

          CardAdminHome(imge: AppImageAssets.product, title: "Items",onClick: (){
            Get.toNamed(RoutesApp.itemsview);
          },),

          CardAdminHome(imge: AppImageAssets.messge, title: "Message",onClick: (){},),

          CardAdminHome(imge: AppImageAssets.notification, title: "Notification",onClick: (){},),
          CardAdminHome(imge: AppImageAssets.report, title: "Report",onClick: (){},),
          CardAdminHome(imge: AppImageAssets.orders, title: "Ordes",onClick: (){
            Get.toNamed(RoutesApp.orderhome);
          },),
         
        ],
        ),
        
      ]),

    );
  }
}