import 'package:flutter/material.dart';
import 'package:flutter_application_didongnangcao/auth/login.dart';
import 'package:flutter_application_didongnangcao/page/detail/detail.dart';
import 'package:flutter_application_didongnangcao/page/home/homewidget.dart';
import 'package:flutter_application_didongnangcao/page/info/infowidget.dart';
import 'package:flutter_application_didongnangcao/page/login/dangnhap.dart';
import 'package:flutter_application_didongnangcao/page/order/order.dart';
import 'mainpage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),);
  }
}
