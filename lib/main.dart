import 'package:flutter/material.dart';
import 'package:flutter_application_didongnangcao/page/info/infowidget.dart';
import 'package:flutter_application_didongnangcao/page/login/dangnhap.dart';
import 'mainpage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    home: DangNhap(),);
  }
}
