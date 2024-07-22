// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_didongnangcao/data/api.dart';
import 'package:flutter_application_didongnangcao/data/sqlite.dart';
import 'package:flutter_application_didongnangcao/model/cart.dart';
import 'package:flutter_application_didongnangcao/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_didongnangcao/model/user.dart';
import 'package:flutter_application_didongnangcao/page/home/Homesearchbarwidget.dart';
import 'package:flutter_application_didongnangcao/page/home/home_appbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBuilder extends StatefulWidget {
  const HomeBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<HomeBuilder> {
  final DatabaseHelper _databaseService = DatabaseHelper();
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMDM2NzcwMzM0NiIsIklEIjoiMjFESDExMDE4MSIsImp0aSI6IjljZjA5ZjZmLWQ0M2UtNGY4ZC1hNjMzLWNjZDVmY2NhYzNjZCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN0dWRlbnQiLCJleHAiOjE3Mjk1ODM5NDZ9.qFLnjUJkdSpXtxqj3145zCbk1Cy1LkWMf7huY5KRLtA";
  String accountID = "21DH110181";
  Future<List<ProductModel>> _getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getProduct(accountID, token);
  }

  User user = User.userEmpty();
  //int _selectedIndex = 0;
  //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    user = User.fromJson(jsonDecode(strUser));
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUser();
    print(user.imageURL);
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
    return Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: FutureBuilder<List<ProductModel>>(
          future: _getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  home_appbarwidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeSearchBar(),
                  const SizedBox(height: 40),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: snapshot.data!.map((itemProduct) {
                          return _buildProductScroll(itemProduct, context);
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Các nhà hàng được đề xuất",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(227, 34, 39, 1)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final itemProduct = snapshot.data![index];
                        return _buildProduct(itemProduct, context);
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  Widget _buildProduct(ProductModel pro, BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              child: Text(
                pro.id.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            /* ảnh ở đây*/
            //ignore: unnecessary_null_comparison
            //  if(pro.imageUrl.length> 10 )
            //   Container(
            //       height: 110,
            //       width: 110,
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: FileImage(File(pro.imageUrl)),
            //               fit: BoxFit.cover)),
            //       alignment: Alignment.center,
            //       child: Image.network(pro.imageUrl),
            //     ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pro.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    NumberFormat('#,##0').format(pro.price),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.red,
                    ),
                  ),
                  // const SizedBox(height: 4.0),
                  // Text('Category: ${pro.catId}'),
                  const SizedBox(height: 4.0),
                  Text(pro.description),
                ],
              ),
            ),
            IconButton(
                onPressed: () async {
                  _onSave(pro);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildProductScroll(ProductModel pro, BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
        ),
        width: 200,
        // margin: const EdgeInsets.only(right: 10),
        // color: Colors.white,
        // width: 200,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: FileImage(File(pro.imageUrl)),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(height: 10),
                Text(
                  pro.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // const Icon(
                    //   Iconsax.star1,
                    //   size: 23,
                    //   color: Colors.yellow,
                    // ),
                    OutlinedButton(
                      onPressed: () async {
                        _onSave(pro);
                      },
                      child: const Text(
                        "Đặt bàn",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(227, 34, 39, 1)),
                      ),
                    ),
                    // Expanded(child: IconButton(

                    //     onPressed: () async {
                    //       _onSave(pro);
                    //     },
                    //     icon: const Icon(
                    //       Icons.add,
                    //       color: Colors.blue,
                    //       size: 5,
                    //     )),)

                    // const Text(
                    //   " · ",
                    //   style: TextStyle(color: Colors.grey),
                    // ),
                    // IconButton(
                    //     onPressed: () async {
                    //       //_onSave(pro);
                    //     },
                    //     icon: const Icon(
                    //       Icons.add,
                    //       color: Colors.blue,
                    //     )),
                    // Text(
                    //   "${restaurant[index].time} Min",
                    //   style: const TextStyle(
                    //     fontSize: 12,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
            Positioned(
              top: 1,
              right: 1,
              child: IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  // fixedSize:  Size(30, 30),
                ),
                iconSize: 20,
                icon: const Icon(Iconsax.heart),
              ),
            )
          ],
        ));
  }
}
