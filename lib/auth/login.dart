import 'package:flutter_application_didongnangcao/config/const.dart';
import 'package:flutter_application_didongnangcao/data/api.dart';
import 'package:flutter_application_didongnangcao/mainpage_admin.dart';
//import 'package:flutter_application_didongnangcao/route/page1.dart';
import '../auth/register.dart';
import 'package:flutter_application_didongnangcao/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../data/sharepre.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  login() async {
   
    //lấy token (lưu share_preference)
    String token = await APIRepository()
        .login(accountController.text, passwordController.text);
    var user = await APIRepository().current(token);
    // save share
    saveUser(user);
    //
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Mainpage()));

        if(user.idNumber == "082203004113")
        {
          Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AdminPage()));
        }
    return token;
    
  }

  @override
  void initState() {
    super.initState();
    // autoLogin();
  }

  autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Mainpage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  controller: accountController,
                  decoration: const InputDecoration(
                    labelText: "Tài khoản",
                    icon: Icon(Icons.email),
                  ),
                ),
                //password
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
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
                        onPressed: login, 
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
                            MaterialPageRoute(builder: (context) => Register()),
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
