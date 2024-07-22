import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_didongnangcao/data/api.dart';
import 'package:flutter_application_didongnangcao/data/sqlite.dart';
import 'package:flutter_application_didongnangcao/model/cart.dart';
import 'package:flutter_application_didongnangcao/model/product.dart';
import 'package:flutter_application_didongnangcao/model/user.dart';
import 'package:flutter_application_didongnangcao/page/category/category_list.dart';
import 'package:flutter_application_didongnangcao/page/info/changeinfowidget.dart';
import 'package:flutter_application_didongnangcao/page/login/dangnhap.dart';
import 'package:flutter_application_didongnangcao/page/product/product_list.dart';

//import 'package:flutter_application_lab_7/data/model/productmodel.dart';

//import '../../conf/const.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

//import '../../data/model/product_viewmodel.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});
  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}
class _HomeAdminState extends State<HomeAdmin> {
  final DatabaseHelper _databaseService = DatabaseHelper();
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMDM2NzcwMzM0NiIsIklEIjoiMjFESDExMDE4MSIsImp0aSI6IjljZjA5ZjZmLWQ0M2UtNGY4ZC1hNjMzLWNjZDVmY2NhYzNjZCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN0dWRlbnQiLCJleHAiOjE3Mjk1ODM5NDZ9.qFLnjUJkdSpXtxqj3145zCbk1Cy1LkWMf7huY5KRLtA";
  String accountID = "21DH110181";
  Future<List<ProductModel>> _getProducts() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getProduct(accountID, token);
  }

  Future<void> _onSave(ProductModel pro) async {
    _databaseService.insertProduct(Cart(
        productID: pro.id,
        name: pro.name,
        des: pro.description,
        price: pro.price,
        img: pro.imageUrl,
        count: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //nut dang ki
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryList()),
                          );
                        },
                        child: const Text(
                          "Quản lí danh mục",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(227, 34, 39, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductList()),
                          );
                        },
                        child: const Text(
                          "Quản lí quán",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(227, 34, 39, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}