import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_list_app/app/utlities/dio_client.dart';

import 'app/routes/app_pages.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(()=>DioClient(getIt()));
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
