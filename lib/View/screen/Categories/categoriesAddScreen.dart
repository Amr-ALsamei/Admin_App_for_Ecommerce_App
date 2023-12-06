import 'package:adminapp/Controller/categories/add_controller.dart';
import 'package:adminapp/Core/constant/colors.dart';
import 'package:adminapp/Core/function/validator.dart';
import 'package:adminapp/Core/shared/CustomButtonglobal.dart';
import 'package:adminapp/Core/shared/CustomFormglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesAddScreen extends StatelessWidget {
  const CategoriesAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CategoriesAddController controller=Get.put(CategoriesAddController());
    return Scaffold(
      appBar: AppBar(title: Text("Categories Add")),
      body: GetBuilder<CategoriesAddController>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(10),
            child: ListView(children: [
               Form(
                key: controller.formsate,
                child: Column(children: [
                CustumFormGlobal(
                label: "Category name",
                 hinttext: "Ensert Category name",
                  icon: Icons.category, 
                  mycontroller: controller.name, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),
          
               CustumFormGlobal(
                label: "Category name(Arabic)",
                 hinttext: "Ensert Category name(Arabic)",
                  icon: Icons.category, 
                  mycontroller: controller.namear, 
                  valid: (val){
                    return ValidInput(val!, 1, 100, "username");
                  }, isNumber: false),
          
                    
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
                        controller.addData();
                    }, buttontitle:"ADD")
                  
          
            ],),
          );
        }
      ),
    );
  }
}