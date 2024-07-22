import 'package:flutter/material.dart';
import 'package:flutter_application_didongnangcao/mainpage.dart';
import 'package:flutter_application_didongnangcao/page/category/category_list.dart';
import 'package:flutter_application_didongnangcao/page/favorite/favoritewidget.dart';
import 'package:flutter_application_didongnangcao/page/home/home_list.dart';
import 'package:flutter_application_didongnangcao/page/home/home_admin.dart';
import 'package:flutter_application_didongnangcao/page/info/infowidget.dart';
import 'package:flutter_application_didongnangcao/page/detail/detail.dart';
import 'package:flutter_application_didongnangcao/page/product/product_list.dart';
import 'page/home/homewidget.dart';
import 'package:flutter_application_didongnangcao/page/login/dangki.dart';
import 'package:flutter_application_didongnangcao/page/login/dangnhap.dart';
import 'dart:convert';
import 'package:flutter_application_didongnangcao/model/category.dart';
import 'package:flutter_application_didongnangcao/model/user.dart';
import 'package:flutter_application_didongnangcao/page/detail/detail.dart';
import 'package:flutter/material.dart';
import 'data/sharepre.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 0;
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  

  static const List<Widget> _widgetOptions = <Widget>[
    HomeAdmin(),
    InfoWidget(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Thay đổi màu ở đây
        ),
        title: const Text(
          "Triangle",
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        backgroundColor: Color.fromRGBO(227, 34, 39, 1),
        
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/logo.png',
              width: 50,
              height: 50,
            ), // Hiển thị ảnh từ assets
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainpage()),
              );
              // Xử lý khi người dùng nhấn vào ảnh
            },
          ),
        ],
        //automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(227, 34, 39, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    user.fullName.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    user.birthDay.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Trang chủ'),
              onTap: () {
                Navigator.pop(context);
                _selectedIndex = 0;
                setState(() {});
              },
            ),
            
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Thông tin'),
              onTap: () {
                Navigator.pop(context);
                _selectedIndex = 1;
                setState(() {});
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            
            
            if(user.idNumber == "082203004113")
                ListTile(
                leading: const Icon(Icons.manage_search_rounded),
                title: const Text('Quản lí quán'),
                onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductList()),
                    ); 
                },
              ),
           if(user.idNumber == "082203004113")
                ListTile(
                leading: const Icon(Icons.manage_search_rounded),
                title: const Text('Quản lí danh mục'),
                onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryList()),
                    ); 
                },
              ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Đăng xuất'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DangNhap()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Trang chủ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Thông tin'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(227, 34, 39, 1),
        onTap: _onItemTapped,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
        color: const Color.fromRGBO(227, 34, 39, 1),
      ),
    );
  }
}
