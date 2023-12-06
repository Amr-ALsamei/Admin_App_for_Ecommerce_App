
import 'package:adminapp/Core/Localization/changelocal.dart';
import 'package:adminapp/Core/constant/colors.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/View/widget/ButtonLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends GetView<LocalController> {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Image.asset("assets/images/imaglang2.jpeg",fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
          ),
          Center(
            child: Column(   
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text("1".tr,style: TextStyle(fontWeight: FontWeight.bold,
               fontSize: 30,color: Colors.black,backgroundColor: Appcolors.primarycolor),
               ),
                ButtonLanguage(textbutton: "Arabic ", onPressed: (){
                  controller.changeLang("ar");
                  Get.toNamed(RoutesApp.onbordingRoute);
                }),
                SizedBox(height: 5,),
                 ButtonLanguage(textbutton: "English", onPressed: (){
                  controller.changeLang("en");
                  Get.toNamed(RoutesApp.onbordingRoute);
                 })
              ],
            ),
          )
        ],
      ) ,
    );
  }
}