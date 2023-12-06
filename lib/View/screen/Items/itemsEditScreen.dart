import 'package:adminapp/Controller/Items/edit_controller.dart';
import 'package:adminapp/Core/constant/colors.dart';
import 'package:adminapp/Core/function/validator.dart';
import 'package:adminapp/Core/shared/CustomButtonglobal.dart';
import 'package:adminapp/Core/shared/CustomFormglobal.dart';
import 'package:adminapp/Core/shared/customDropdownsearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemsEditScreen extends StatelessWidget {
  const ItemsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // ignore: unused_local_variable
   ItemsEditController controller=Get.put(ItemsEditController());
    return Scaffold(
      appBar: AppBar(title: Text("Items Edit")),
      body: GetBuilder<ItemsEditController>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(10),
            child: ListView(children: [
               Form(
                key: controller.formsate,
                child: Column(children: [
                CustomDropdownSearch(
                  title: "Choose Category",
                 listdata: controller.dropdownlist,
                  dropdowselectedName: controller.catName,
                   dropdowselectedID: controller.catId
                   ),


                CustumFormGlobal(
                label: "Item name",
                 hinttext: "Ensert Item name",
                  icon: Icons.category, 
                  mycontroller: controller.name, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),
          
               CustumFormGlobal(
                label: "Item name(Arabic)",
                 hinttext: "Ensert Item name(Arabic)",
                  icon: Icons.category, 
                  mycontroller: controller.namear, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),
                
                
                
                CustumFormGlobal(
                label: "Item Description",
                 hinttext: "Ensert Item Description",
                  icon: Icons.category, 
                  mycontroller: controller.description, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),
                
                CustumFormGlobal(
                label: "Item Description Arabic",
                 hinttext: "Ensert Item Description Arabic",
                  icon: Icons.category, 
                  mycontroller: controller.descriptionar, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),
                
                CustumFormGlobal(
                label: "Item count",
                 hinttext: "Ensert Item count",
                  icon: Icons.category, 
                  mycontroller: controller.count, 
                  valid: (val){
                    return ValidInput(val!, 1, 10, "number");
                  }, isNumber: true),
                
                CustumFormGlobal(
                label: "Item price",
                 hinttext: "Ensert Item Price",
                  icon: Icons.category, 
                  mycontroller: controller.price, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "number");
                  }, isNumber: true),
          
          
                    
               ],)),
                 SizedBox(height: 30,),
                 if(controller.file !=null)
                 SvgPicture.file(controller.file!,width: 70,height: 70,),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 50),
                   child: MaterialButton(
                        
                        color: Appcolors.thirdcolor,
                        onPressed: (){
                          controller.chooseImage();
                        },child: Text("Choose Category Image"),),
                 ),
          
                  SizedBox(height: 30,),
                  CustomButtonGlobal(
                    onPressed: (){
                        controller.editData();
                    }, buttontitle:"EDIT")
                  
          
            ],),
          );
        }
      ),
    );
  }
}