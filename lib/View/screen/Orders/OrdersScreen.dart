

import 'package:adminapp/Controller/orders/ordersScreen_controller.dart';
import 'package:adminapp/View/widget/custombottomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenControllerImp());
    return GetBuilder<OrdersScreenControllerImp>(
      builder:(controller)=> Scaffold(
        appBar: AppBar(title: Text("Orders")),
        
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(  ),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              ...List.generate(controller.listPages.length , (index) { 
               
              return   
               CustomBottomAppBar(onPressed: () {
                    controller.ChangePage(index);
                  },
                  title: controller.Bottomappbar[index]["title"],
                  icon: controller.Bottomappbar[index]["icon"],active:controller.currentpage==index? true:false,);
                  
                  }
                  ),
             
            ],
          ),
        ),
        
        body: controller.listPages.elementAt(controller.currentpage),
          
      ),
    );
  }
}