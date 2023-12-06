
import 'package:adminapp/Core/class/statusrequest.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/Core/function/handlingdata.dart';
import 'package:adminapp/Core/services/services.dart';
import 'package:adminapp/Data/DataSource/remote/Auth/logInData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController{
  login();
 
  goToForgetPassword();
}

class LogInControllerImp extends LogInController{

 GlobalKey<FormState> formstatelog=GlobalKey<FormState>();

 late TextEditingController email;
 late TextEditingController password;

  bool isShowPassword=false;

  StatusRequest statusRequest=StatusRequest.None;
  LogInData logInData=LogInData(Get.find());

  MyServices myServices=Get.find();

  ShowPassword(){
    isShowPassword=isShowPassword==true?false:true;
    update();

  }

  @override
  login()async {
    if(formstatelog.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await logInData.LogInPostData(email.text,password.text);
    // print(response);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        // data.addAll(response['data']);
        // print(response['data']['user_aproov'].runtimeType);
       
       if(response['data']['Admin_aproov']==1){
         myServices.sharedPref.setString("Id", response['data']['Admin_Id'].toString());
         String adminid=myServices.sharedPref.getString("Id")!;
        myServices.sharedPref.setString("username",response['data']['Admin_name'] );
        myServices.sharedPref.setString("email",response['data']['Admin_email'] );
        myServices.sharedPref.setString("phone",response['data']['Admin_phone'] );
         myServices.sharedPref.setString("step","2" );
         FirebaseMessaging.instance.subscribeToTopic("Servecies");
         FirebaseMessaging.instance.subscribeToTopic("Servecies${adminid}");
        Get.offNamed(RoutesApp.adminhome);
       }else{
        Get.toNamed(RoutesApp.verfyCodeSignUp,arguments: {
               "email":email.text
        });
       }
      // Get.delete<SignUpControllerImp>();
        }else{
          Get.defaultDialog(title: "Wraning",
          middleText: "Password or email not correct");
          statusRequest=StatusRequest.failure;
        }
    }
    update();
      
    
    }
  }
  
  

  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value){
    //     print(value);
    //     // ignore: unused_local_variable
    //     String? token=value;
    // });
    email=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  goToForgetPassword() {
   Get.toNamed(RoutesApp.forgetpassword);
  }

}