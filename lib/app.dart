import 'package:flutter/material.dart';
import 'package:flutter_dev_test/config/routes/routes_app.dart';
import 'package:flutter_dev_test/config/routes/routes_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _screenUtilInit();
  }

  ScreenUtilInit _screenUtilInit() {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return _materialApp();
      },
    );
  }

  MaterialApp _materialApp() {
    return MaterialApp(
      title: 'Teste Técnico 7COMm',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: RoutesApp.loginPage,
    );
  }
}
