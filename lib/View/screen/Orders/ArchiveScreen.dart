
import 'package:adminapp/Controller/orders/archive_controller.dart';
import 'package:adminapp/Core/class/handlingdataview.dart';
import 'package:adminapp/View/widget/orders/orderslistArchiveCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminArchiveScreen extends StatelessWidget {
  const AdminArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return   Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<ArchiveOrdersController>(
            builder: (controller) {
              return HandlingDataView(statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CardOrdersArchive(listdata: controller.data[index],),
              
                
                    ),
              );
            }
          ),);
    
  }
}