import 'package:flutter/material.dart';
import 'package:flutter_application_didongnangcao/page/login/dangnhap.dart';

//import 'package:flutter_application_lab_7/data/model/productmodel.dart';

//import '../../conf/const.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/painting.dart';

//import '../../data/model/product_viewmodel.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  final _nameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _nationController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  List listitem = ["Việt Nam", "Nước Ngoài"];
  var selectedNationality = '';
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
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Sắp xếp các widget con cách đều nhau
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/Rose.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Tên',
                            hintText: 'Nhập tên của bạn',
                            filled: true, // Bật nền cho trường
                            fillColor: Colors.white, // Màu nền
                            contentPadding:
                                EdgeInsets.all(15.0), // Khoảng cách nội dung
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Bo tròn các góc
                            ),
                          ),
                        ),
                      ),
                    ]),
                //nhap fullname
                const SizedBox(height: 16),
                //email
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ngày sinh',
                        hintText: 'Nhập ngày sinh của bạn',
                        filled: true, // Bật nền cho trường
                        fillColor: Colors.white, // Màu nền
                        contentPadding:
                            EdgeInsets.all(15.0), // Khoảng cách nội dung
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Bo tròn các góc
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Nhập email của bạn',
                        filled: true, // Bật nền cho trường
                        fillColor: Colors.white, // Màu nền
                        contentPadding:
                            EdgeInsets.all(15.0), // Khoảng cách nội dung
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Bo tròn các góc
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quốc tịch',
                        hintText: 'Nhập quốc tịch của bạn',
                        filled: true, // Bật nền cho trường
                        fillColor: Colors.white, // Màu nền
                        contentPadding:
                            EdgeInsets.all(15.0), // Khoảng cách nội dung
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Bo tròn các góc
                        ),
                      ),
                    ),

                    // Expanded(child:
                    // DropdownButton<String>(
                    //     hint: const Text("Chọn quốc tịch"),
                    //     value: selectedNationality,
                    //     onChanged: (newValue) {
                    //       setState(() {
                    //         selectedNationality = newValue.toString();
                    //       });
                    //     }, items: ['Việt nam', 'Nước ngoài'].map((option) => DropdownMenuItem<String>(
                    //       value: option,
                    //       child: Text(option))).toList(),
                    //       disabledHint: Text("Chọn một tùy chọn"),

                    //   ),

                    // ),

                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Số điện thoại',
                        hintText: 'Nhập số điện thoại của bạn',
                        filled: true, // Bật nền cho trường
                        fillColor: Colors.white, // Màu nền
                        contentPadding:
                            EdgeInsets.all(15.0), // Khoảng cách nội dung
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Bo tròn các góc
                        ),
                      ),
                    ),
                  ],
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
                          var fullname = _nameController.text;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Fullname: $fullname"),
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Save",
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
                          "Logout",
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
