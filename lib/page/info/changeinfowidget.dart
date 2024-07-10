import 'package:flutter/material.dart';
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

class Changeinfowidget extends StatefulWidget {
  const Changeinfowidget({super.key});

  @override
  State<Changeinfowidget> createState() => _ChangeInfoWidgetState();
}

class _ChangeInfoWidgetState extends State<Changeinfowidget> {
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
  Future<void> _selecteDate() async {
    DateTime? _picked = await showDatePicker(context: 
    context, firstDate: DateTime(1950), lastDate: DateTime.now(),
    initialDate: DateTime.now(),
    );
    if (_picked!= null){
      setState(() {
        _birthdayController.text = _picked.toString().split(" ")[0];
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
                const SizedBox(width: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: _pickImage,
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                //email
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _birthdayController,
                            decoration: InputDecoration(
                              labelText: 'Ngày sinh',
                              hintText: 'Nhập ngày sinh của bạn',
                              filled: true, // Bật nền cho trường
                              fillColor: Colors.white, // Màu nền
                              contentPadding:
                                  EdgeInsets.all(15.0), // Khoảng cách nội dung
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Bo tròn các góc
                              ),
                              
                            ),
                            readOnly: true,
                            onTap: (){
                              _selecteDate();
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
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
                        labelText: 'Giới tính',
                        hintText: 'Nhập giới tính của bạn',
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
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.all(15.0), // Khoảng cách nội dung
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Bo tròn các góc
                        ),
                      ),
                      keyboardType: TextInputType.number,
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
                          var fullname = _birthdayController.text;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Ngày sinh: $fullname"),
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
