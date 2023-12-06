
import 'package:adminapp/Controller/orders/pending_controller.dart';
import 'package:adminapp/Core/class/handlingdataview.dart';
import 'package:adminapp/View/widget/orders/orderslistCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPendingScreen extends StatelessWidget {
  const AdminPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return  Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<PendingOrdersController>(
          builder: (controller) {
            return HandlingDataView(statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CardOrders(listdata: controller.data[index],),
            
              
                  ),
            );
          }
        ),);
    
  }
}