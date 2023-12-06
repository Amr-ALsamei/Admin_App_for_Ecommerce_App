
import 'package:adminapp/Controller/orders/accepted_controller.dart';
import 'package:adminapp/Core/class/handlingdataview.dart';
import 'package:adminapp/View/widget/orders/orderslistCardAccepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminAcceptedScreen extends StatelessWidget {
  const AdminAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedOrdersController());
    return  Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<AcceptedOrdersController>(
          builder: (controller) {
            return HandlingDataView(statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CardOrdersAccepted(listdata: controller.data[index],),
            
              
                  ),
            );
          }
        ),);
    
  }
}