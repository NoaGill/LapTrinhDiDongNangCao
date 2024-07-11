import 'package:flutter/material.dart';
import 'package:flutter_application_didongnangcao/page/info/changeinfowidget.dart';
import 'package:flutter_application_didongnangcao/page/login/dangnhap.dart';

//import 'package:flutter_application_lab_7/data/model/productmodel.dart';

//import '../../conf/const.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//import '../../data/model/product_viewmodel.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _nationController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  File? _image;
  List listitem = ["Việt Nam", "Nước Ngoài"];
  var selectedNationality = '';
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imgController.text =
            pickedFile.path; // Save the image path in the controller
      });
    }
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
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Thông tin của bạn",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(227, 34, 39, 1)),
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/user.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                    // Sắp xếp các widget con cách đều nhau
                    children: [
                      Expanded(
                        flex: 1,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.edit_outlined,
                          size: 24.0,
                        ),
                      )),
                      Expanded(
                        flex: 3,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Tên người dùng")
                      )),
                      Expanded(
                        flex: 6,
                          child: Text(
                        "Lê Hữu Bền",
                        textAlign: TextAlign.end,
                      )),
                    ]),
                //nhap fullname
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                //email
                const Row(
                    // Sắp xếp các widget con cách đều nhau
                    children: [
                      Expanded(
                        flex: 1,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.phone_outlined,
                          size: 24.0,
                        ),
                      )),
                      Expanded(
                        flex: 3,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Số điện thoại")
                      )),
                      Expanded(
                        flex: 6,
                          child: Text(
                        "0367703344",
                        textAlign: TextAlign.end,
                      )),
                    ]),
                //nhap fullname
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                const Row(
                    // Sắp xếp các widget con cách đều nhau
                    children: [
                      Expanded(
                        flex: 1,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.email_outlined,
                          size: 24.0,
                        ),
                      )),
                      Expanded(
                        flex: 3,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email")
                      )),
                      Expanded(
                        flex: 6,
                          child: Text(
                        "lehuuben@gmail.com",
                        textAlign: TextAlign.end,
                      )),
                    ]),
                //nhap fullname
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                const Row(
                    // Sắp xếp các widget con cách đều nhau
                    children: [
                      Expanded(
                        flex: 1,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.male_outlined,
                          size: 24.0,
                        ),
                      )),
                      Expanded(
                        flex: 3,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Giới tính")
                      )),
                      Expanded(
                        flex: 6,
                          child: Text(
                        "Nam",
                        textAlign: TextAlign.end,
                      )),
                    ]),
                //nhap fullname
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                const Row(
                    // Sắp xếp các widget con cách đều nhau
                    children: [
                      Expanded(
                        flex: 1,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.cake_outlined,
                          size: 24.0,
                        ),
                      )),
                      Expanded(
                        flex: 3,
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Ngày sinh")
                      )),
                      Expanded(
                        flex: 6,
                          child: Text(
                        "24/08/2003",
                        textAlign: TextAlign.end,
                      )),
                    ]),
                //nhap fullname
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                
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
                                builder: (context) => Changeinfowidget()),
                          );
                        },
                        child: const Text(
                          "Thay đổi thông tin",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(227, 34, 39, 1)),
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
                        child: const Text(
                          "Đăng xuất",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(227, 34, 39, 1)),
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
