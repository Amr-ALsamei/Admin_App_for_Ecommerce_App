import 'package:adminapp/Controller/Items/view_controller.dart';
import 'package:adminapp/Core/class/handlingdataview.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/linkAPI.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsViewScreen extends StatelessWidget {
  const ItemsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // CategoriesModel listdata;
    // ignore: unused_local_variable
    Get.put(ItemsViewController());
    return Scaffold (
      appBar: AppBar(title: Text("Items")),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(RoutesApp.itemsadd);},
       child: Icon(Icons.add),),
      body: GetBuilder<ItemsViewController>(
        builder: (controller) {
          return HandlingDataView(statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: (){
                return controller.onMakeBack();
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: ListView(
                  
                  children: [
                    ...List.generate(
                      controller.itemslist.length, (index) => InkWell(
                        onTap: (){
                          controller.goToEditPage(controller.itemslist[index]);
                        },
                        child: Card(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CachedNetworkImage(imageUrl:  "${AppLinks.imageitem}/${controller.itemslist[index].itemImage}",
                                width: 80,height: 80,)
                                ),
                                Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: (){
                                           
                                            Get.defaultDialog(title: "Wraning",
                                                   middleText: "Are you sure to delete this item",onCancel: (){},
                                                   onConfirm: (){
                                                    controller.deletItem(
                                                       controller.itemslist[index].itemID.toString(),
                                                       controller.itemslist[index].itemImage!);
                                                       Get.back();
                                                   }
                                                   );
                                            
                                          }, icon: Icon(Icons.delete)),
                                          
                                     
                                      ],
                                    ),
                                    title: Text(
                                      controller.itemslist[index].itemName!),
                                    subtitle: Text( controller.itemslist[index].categoryName!),
                                      
                                  )
                                  ),
                                
                                
                               
                              ],
                            ),
                        ),
                      ))
              
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}