import 'package:flutter/material.dart';
import 'package:flutter_application_didongnangcao/page/favorite/favoritewidget.dart';
import 'package:flutter_application_didongnangcao/page/info/infowidget.dart';
import 'package:flutter_application_didongnangcao/page/detail/detail.dart';
import 'page/home/homewidget.dart';
import 'package:flutter_application_didongnangcao/page/login/dangki.dart';
import 'package:flutter_application_didongnangcao/page/login/dangnhap.dart';
// import 'package:flutter_application_lab_7/page/homewiget.dart';
// import 'package:flutter_application_lab_7/page/product/productlist.dart';
// import 'package:flutter_application_lab_7/page/product/productcart.dart';
// import 'package:provider/provider.dart';
// import '../data/model/product_viewmodel.dart';
// import '../data/model/cartcounter.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;
  //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Homewidget(),
    Favoritewidget(),
    InfoWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text(
          "Triangle",
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        backgroundColor: Color.fromRGBO(227, 34, 39, 1),
        
        actions: <Widget>[
          IconButton(
            icon:
                Image.asset('assets/images/logo.png',width: 50,height: 50,), // Hiển thị ảnh từ assets
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
            const DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(227, 34, 39, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://media-cdn-v2.laodong.vn/storage/newsportal/2022/9/9/1090978/Rose-8B1a.jpg'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Lê Hữu Bền',style: TextStyle(color: Colors.white),),
                  Text('lehuuben@gmail.com',style: TextStyle(color: Colors.white),),
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
              leading: const Icon(Icons.contact_mail),
              title: const Text('Yêu thích'),
              onTap: () {
                Navigator.pop(context);
                _selectedIndex = 1;
                setState(() {});
              },
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Thông tin'),
              onTap: () {
                Navigator.pop(context);
                _selectedIndex = 2;
                setState(() {});
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Đăng Nhập'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dangki()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Đăng Xuất'),
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
              icon: Icon(Icons.heart_broken_outlined), label: 'Yêu thích'),
          // BottomNavigationBarItem(icon: Icon(Icons.percent_outlined),
          // label: 'Offer'),
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
