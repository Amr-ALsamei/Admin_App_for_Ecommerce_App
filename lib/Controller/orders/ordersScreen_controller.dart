
import 'package:adminapp/View/screen/Orders/AcceptedScreen.dart';
import 'package:adminapp/View/screen/Orders/ApendingScreen.dart';
import 'package:adminapp/View/screen/Orders/ArchiveScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersScreenController extends GetxController{

  ChangePage(int currentpage);
}

class OrdersScreenControllerImp extends OrdersScreenController{
 int currentpage=0;
 List<Widget> listPages=[
  const  AdminPendingScreen(),
  const AdminAcceptedScreen(),
  const AdminArchiveScreen()


 ];

 List Bottomappbar=[
  { "title":"Pending","icon":Icons.pending_rounded},
  { "title":"Accepted","icon":Icons.accessible_sharp},
   { "title":"Archive","icon":Icons.archive_outlined},
  // { "title":"Accepted","icon":Icons.accessibility_new_sharp},
 
 ];

  @override
  ChangePage(int i) {
    currentpage=i;
    update();
  }

}