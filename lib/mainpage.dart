import 'package:flutter/material.dart';
// import 'package:flutter_application_lab_7/page/homewiget.dart';
// import 'package:flutter_application_lab_7/page/product/productlist.dart';
// import 'package:flutter_application_lab_7/page/product/productcart.dart';
// import 'package:provider/provider.dart';
// import '../data/model/product_viewmodel.dart';
// import '../data/model/cartcounter.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}): super(key:key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Triangle"),
        actions: [
          InkWell(
            onTap: (){
              _onItemTapped(2);
            },
            child: Padding(padding: 
            const EdgeInsets.only(left: 0,right: 15,top: 8,bottom: 8),
            child: Stack(children: [
              const Align(
                alignment: Alignment.bottomCenter,
                child: Icon(Icons.shopping_bag,size: 24)
              ),
              
            ],),
            ),
            
          )
        ],
      ),
      body: Container(
        // child: _widgetOptions.elementAt(_selectedIndex),
        color: const Color.fromRGBO(227, 34, 39, 1),
       
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
          label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.heart_broken_outlined),
          label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.percent_outlined),
          label: 'Offer'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),
          label: 'Info'),
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(227, 34, 39, 1),
        onTap: _onItemTapped, backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}