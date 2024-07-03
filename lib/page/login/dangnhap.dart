import 'package:flutter_application_didongnangcao/mainpage.dart';
import 'package:flutter_application_didongnangcao/page/login/dangki.dart';
import 'package:flutter/material.dart';

class DangNhap extends StatefulWidget {
  const DangNhap({super.key});

  @override
  State<DangNhap> createState() => _DangNhap();
}

class _DangNhap extends State<DangNhap> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng nhập"), 
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
                  child: const Text("Đăng nhập", 
                  style: TextStyle(fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(227, 34, 39, 1)),
                  ),
                ),
                //email
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
                //nut nho mat khau va quen mat khau
                _buildRememberForgot(),
                //nut dang nhap
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Mainpage()),
                          );
                        },
                        child: const Text("Đăng nhập",
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
                            MaterialPageRoute(builder: (context) => Dangki()),
                          );
                        },
                        child: const Text("Đăng ký",
                        style: TextStyle(color: Colors.white),),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(227, 34, 39, 1)),
                        ),
                      ),
                    ),     
                  ],
                ),
                const SizedBox(height: 32),
                Text("Hoặc đăng nhập với"),
                //icon dang nhap khac
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Tab(icon: Image.asset("assets/images/gg.png")),
                    Tab(icon: Image.asset("assets/images/apple.png")),
                    Tab(icon: Image.asset("assets/images/fb.png")),
                    
                  ],
                )              
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [Checkbox(value: rememberUser, 
          onChanged: (value) {
            setState(() {
              rememberUser = value!;
            });
          }),
          Text("Ghi nhớ đăng nhập"),
          ],
        ),
        TextButton(
          onPressed: () {}, child: Text("Quên mật khẩu"))
      ],
    );
  }
}