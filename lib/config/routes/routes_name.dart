import 'package:flutter/material.dart';
import 'package:flutter_dev_test/config/routes/routes_app.dart';
import 'package:flutter_dev_test/features/home/presentation/screens/home_page.dart';
import 'package:flutter_dev_test/features/login/presentation/screens/login_page.dart';
import 'package:flutter_dev_test/features/otp/presentation/screens/otp_page.dart';

final Map<String, WidgetBuilder> routes = {
  RoutesApp.otpPage: (context) => const OtpPage(),
  RoutesApp.homePage: (context) => const HomePage(),
  RoutesApp.loginPage: (context) => const LoginPage(),
};
