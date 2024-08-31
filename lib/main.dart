import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_list_app/app/data/theme_data.dart';

import 'app/data/db_services.dart';
import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService().initDatabase();
  runApp(
    GetMaterialApp(
      title: 'Todo List App',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppThemeData.themeData,
      debugShowCheckedModeBanner: false,
    ),
  );
}
