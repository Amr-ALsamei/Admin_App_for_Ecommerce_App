
// import 'package:flutter/material.dart';
import 'package:adminapp/Core/Middleware/AppMiddleWare.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/View/screen/AdminHome.dart';
import 'package:adminapp/View/screen/Auth/forgetPassword/SuccessedResetPassword.dart';
import 'package:adminapp/View/screen/Auth/forgetPassword/forgetPassword.dart';
import 'package:adminapp/View/screen/Auth/forgetPassword/resetPassword.dart';
import 'package:adminapp/View/screen/Auth/forgetPassword/verfyCode.dart';
import 'package:adminapp/View/screen/Auth/login.dart';
import 'package:adminapp/View/screen/Categories/categoriesAddScreen.dart';
import 'package:adminapp/View/screen/Categories/categoriesEditScreen.dart';
import 'package:adminapp/View/screen/Categories/categoriesViewScreen.dart';
import 'package:adminapp/View/screen/Items/itemsAddScreen.dart';
import 'package:adminapp/View/screen/Items/itemsEditScreen.dart';
import 'package:adminapp/View/screen/Items/itemsViewScreen.dart';
import 'package:adminapp/View/screen/Onboarding.dart';
import 'package:adminapp/View/screen/Orders/detailsScreen.dart';
import 'package:adminapp/View/screen/Orders/OrdersScreen.dart';
import 'package:adminapp/View/screen/language.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



 List<GetPage<dynamic>>? routesPages=[
  
  GetPage(name: "/", page: ()=>Languages(),middlewares:[
    AppMiddleWare()
  ] ),
 
  
  GetPage(name: RoutesApp.login, page: ()=>LoginApp()),
  GetPage(name: RoutesApp.onbordingRoute, page: ()=>OnBoarding()),
  GetPage(name: RoutesApp.forgetpassword, page: ()=>ForgetPassword()),
  GetPage(name: RoutesApp.verfyCode, page: ()=>VerificationCode()),
  GetPage(name:  RoutesApp.resetpassword, page: ()=>ResetPassword()),
  GetPage(name: RoutesApp.SuccessResetPassword, page: ()=>SuccessedResetPassword()),
  GetPage(name: RoutesApp.orderscreen, page: ()=>OrdersScreen()),
  GetPage(name: RoutesApp.ordersdetailspage, page: ()=>OrdersDetailsScreen()),
  GetPage(name: RoutesApp.adminhome, page: ()=>AdminHomeScreen()),
    //////////////////////Categories//////////////////
  GetPage(name: RoutesApp.categoriesview, page: ()=>CategoriesViewScreen()),
  GetPage(name: RoutesApp.categoriesadd, page: ()=>CategoriesAddScreen()),
  GetPage(name: RoutesApp.categoriesedit, page: ()=>CategoriesEditScreen()),
   //////////////////////Items//////////////////
  GetPage(name: RoutesApp.itemsview, page: ()=>ItemsViewScreen()),
  GetPage(name: RoutesApp.itemsadd, page: ()=>ItemsAddScreen()),
  GetPage(name: RoutesApp.itemsedit, page: ()=>ItemsEditScreen()),
  //Orders
  GetPage(name: RoutesApp.orderhome, page: ()=>OrdersScreen()),
  
 ];



