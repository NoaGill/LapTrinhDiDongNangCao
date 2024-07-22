
import 'package:flutter_application_didongnangcao/page/login/dangnhap.dart';
import 'package:flutter/material.dart';

class Dangki extends StatefulWidget {
  const Dangki({super.key});

  @override
  State<Dangki> createState() => _DangKi();
}

class _DangKi extends State<Dangki> {
  final _fullname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng kí"), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text("Đăng kí", 
                  style: TextStyle(fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(227, 34, 39, 1)),
                  ),
                ),
                //nhap fullname
                TextFormField(
                  controller: _fullname,
                  decoration: const InputDecoration(
                    labelText: "Tên đầy đủ",
                    icon: Icon(Icons.person),
                  ),
                ),
                //email
                const SizedBox(height: 16),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    icon: Icon(Icons.email),
                  ),
                ),
                //password
                const SizedBox(height: 16),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                    labelText: "Mật khẩu",
                    icon: Icon(Icons.password),
                  ),
                ),
                //confirm
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmpassword,
                  decoration: const InputDecoration(
                    labelText: "Nhập lại mật khẩu",
                    icon: Icon(Icons.password),
                  ),
                ),
                //nut dang ki
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          var fullname = _fullname.text;
                          showDialog(context: context,
                           builder: (context) {
                            return AlertDialog(
                              content: Text("Tên đầy đủ: $fullname"),
                            );
                           },);
                        },
                        child: const Text("Đăng ký",
                        style: TextStyle(color: Colors.white),),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(227, 34, 39, 1)),
                        ),
                      ),
                    ), 
                    const SizedBox(width: 16),  
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DangNhap()),
                          );
                        },
                        child: const Text("Đăng nhập",
                        style: TextStyle(color: Colors.white),),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(227, 34, 39, 1)),
                        ),
                      ),
                    ),     
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}