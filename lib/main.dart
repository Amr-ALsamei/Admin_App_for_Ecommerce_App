import 'package:adminapp/Binding/initialBinding.dart';
import 'package:adminapp/Core/Localization/changelocal.dart';
import 'package:adminapp/Core/services/services.dart';
import 'package:adminapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await InitialServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    LocalController controller= Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:controller.appThem ,
      getPages: routesPages,
      initialBinding:InitialBindings() , 
      
    );
  }
}

