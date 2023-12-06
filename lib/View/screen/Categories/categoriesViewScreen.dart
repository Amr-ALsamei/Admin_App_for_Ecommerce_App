import 'package:adminapp/Controller/categories/view_controller.dart';
import 'package:adminapp/Core/class/handlingdataview.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/linkAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CategoriesViewScreen extends StatelessWidget {
  const CategoriesViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // CategoriesModel listdata;
    // ignore: unused_local_variable
    Get.put(CategoriesViewController());
    return Scaffold (
      appBar: AppBar(title: Text("Categories")),
      floatingActionButton: FloatingActionButton(onPressed: (){Get.toNamed(RoutesApp.categoriesadd);},
       child: Icon(Icons.add),),
      body: GetBuilder<CategoriesViewController>(
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
                      controller.categories.length, (index) => InkWell(
                        onTap: (){
                           controller.goToEditPage(controller.categories[index]);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child:  SvgPicture.network("${AppLinks.imagecategories}/${controller.categories[index].categoryImage}",
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
                                                   middleText: "Are you sure to delete this category",onCancel: (){},
                                                   onConfirm: (){
                                                    controller.deletCategory(
                                                       controller.categories[index].categoryID.toString(),
                                                       controller.categories[index].categoryImage!);
                                                       Get.back();
                                                   }
                                                   );
                                            
                                          }, icon: Icon(Icons.delete)),
                                          
                                      
                                      ],
                                    ),
                                    title: Text(
                                      controller.categories[index].categoryName!),
                                    subtitle: Text(
                                      Jiffy.parse(controller.categories[index].categoryDatetime!).fromNow()),
                                      
                                  )
                                  ),
                                
                                
                               
                              ],
                            ),
                          ) ,
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