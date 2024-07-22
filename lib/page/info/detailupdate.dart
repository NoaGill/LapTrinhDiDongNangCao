import 'package:flutter_application_didongnangcao/data/api.dart';
import 'package:flutter_application_didongnangcao/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_didongnangcao/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_didongnangcao/model/user.dart';
import 'package:flutter_application_didongnangcao/auth/login.dart';

class DetailUpdate extends StatefulWidget {
  final bool isUpdate;
  final User? userModel;

  const DetailUpdate({super.key, this.isUpdate = false, this.userModel});

  @override
  State<DetailUpdate> createState() => _DetailUpdateState();
}

class _DetailUpdateState extends State<DetailUpdate> {
  String? selectedCate;
  List<CategoryModel> categorys = [];
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _accountIdController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _schoolYearController = TextEditingController();
  final TextEditingController _schoolKeyController = TextEditingController();

  String titleText = "";

  // Future<void> _onSave() async {
  //   final idNumber = _idNumberController.text;
  //   final accountId= _accountIdController.text;
  //   final name = _fullnameController.text;
  //   final phoneNumber = _phoneNumberController.text;
  //   final imageUrl = _imageUrlController.text;
  //   final birdhday = _birthdayController.text;
  //   final gender = _genderController.text;
  //   final schoolYear = _schoolYearController.text;
  //   final schoolKey= _schoolKeyController.text;
  //   var pref = await SharedPreferences.getInstance();
  //   await APIRepository().addProduct(
  //       User(
  //           accountId: accountId,
  //           idNumber: idNumber,
  //           fullName: name,
  //           phoneNumber: phoneNumber,
  //           imageURL: imageUrl,
  //           birthDay: birdhday,
  //           gender: gender,
  //           schoolYear: schoolYear,
  //           schoolKey: schoolKey,
  //           dateCreated: schoolKey,
  //           status: true),

  //       pref.getString('token').toString());
  //   setState(() {});
  //   Navigator.pop(context);
  // }

  Future<void> _onUpdate() async {
    final idNumber = _idNumberController.text;
    final accountId = _accountIdController.text;
    final name = _fullnameController.text;
    final phoneNumber = _phoneNumberController.text;
    final imageUrl = _imageUrlController.text;
    final birdhday = _birthdayController.text;
    final gender = _genderController.text;
    final schoolYear = _schoolYearController.text;
    final schoolKey = _schoolKeyController.text;
    var pref = await SharedPreferences.getInstance();
    //update
    await APIRepository().updateInfo(
        User(
            accountId: accountId,
            idNumber: idNumber,
            fullName: name,
            phoneNumber: phoneNumber,
            imageURL: imageUrl,
            birthDay: birdhday,
            gender: gender,
            schoolYear: schoolYear,
            schoolKey: schoolKey,
            dateCreated: TimeOfDay.now().toString(),
            status: true),
        pref.getString('accountID').toString(),
        pref.getString('token').toString());
    setState(() {});
    Navigator.pop(context);
  }
Future<void> _selecteDate() async {
    DateTime? _picked = await showDatePicker(context: 
    context, firstDate: DateTime(1950), lastDate: DateTime.now(),
    initialDate: DateTime.now(),
    );
    if (_picked!= null){
      setState(() {
        _birthdayController.text = "${_picked.day}/${_picked.month.toString().padLeft(2, '0')}/${_picked.year.toString().padLeft(2, '0')}";
      });
    }
  }
  // _getCategorys() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var temp = await APIRepository().getCategory(
  //       prefs.getString('accountID').toString(),
  //       prefs.getString('token').toString());
  //   setState(() {
  //     selectedCate = temp.first.id.toString();
  //     _catIdController.text = selectedCate.toString();
  //     categorys = temp;
  //   });
  // }
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        //_image = File(pickedFile.path);
        _imageUrlController.text =
            pickedFile.path; // Save the image path in the controller
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //_getCategorys();

    if (widget.userModel != null && widget.isUpdate) {
      _idNumberController.text = widget.userModel!.idNumber.toString();
      _accountIdController.text = widget.userModel!.accountId.toString();
      _fullnameController.text = widget.userModel!.fullName.toString();
      _phoneNumberController.text = widget.userModel!.phoneNumber.toString();
      _imageUrlController.text = widget.userModel!.imageURL.toString();
      _birthdayController.text = widget.userModel!.birthDay.toString();
      _genderController.text = widget.userModel!.gender.toString();
      _schoolYearController.text = widget.userModel!.schoolYear.toString();
      _schoolYearController.text = widget.userModel!.schoolYear.toString();
      _schoolKeyController.text = widget.userModel!.schoolKey.toString();
    }
    if (widget.isUpdate) {
      titleText = "Update Account";
    } else
      titleText = "Add New Product";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.image),
                          onPressed: _pickImage,
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Thay đổi hình ảnh"))),
                  Expanded(
                    flex: 6,
                    child: TextField(
                      controller: _imageUrlController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter image URL',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // ClipOval(
              //     child: Image.network(user.imageURL.toString()
              //    ,
              //       width: 100,
              //       height: 100,
              //     ),
              //   ),
              Row(
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
                            child: Text("Id number"))),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: _idNumberController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nhập id number',
                        ),
                      ),
                    ),
                  ]),
              //nhap fullname
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Row(
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
                            child: Text("Account Id"))),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: _accountIdController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nhập Account Id',
                        ),
                      ),
                    ),
                  ]),
              //nhap fullname
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(height: 16),

              Row(
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
                            child: Text("Tên người dùng"))),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: _fullnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nhập tên người dùng',
                        ),
                      ),
                    ),
                  ]),
              //nhap fullname
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              //email
              Row(
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
                            child: Text("Số điện thoại"))),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: _phoneNumberController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nhập số điện thoại',
                          
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ]),
              //nhap fullname
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Row(
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
                            child: Text("Ngày sinh"))),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: _birthdayController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nhập tên ngày sinh',
                        ),
                        //readOnly: true,
                            onTap: (){
                              _selecteDate();
                            },
                           // keyboardType: TextInputType.number,
                      ),
                    ),
                  ]),
              //nhap fullname
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Row(
                  // Sắp xếp các widget con cách đều nhau
                  children: <Widget>[
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
                            child: Text("Giói tính"))),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: _genderController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nhập giới tính',
                        ),
                      ),
                    ),
                  ]),

              //nhap fullname
              const Divider(
                color: Colors.grey,
              ),
              // const SizedBox(height: 16),
              Row(
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
                            child: Text("Năm học"))),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: _schoolYearController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nhập năm học',
                        ),
                      ),
                    ),
                  ]),
              //nhap fullname
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Row(
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
                            child: Text("Mã số năm học"))),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: _schoolKeyController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nhập mã năm học',
                        ),
                      ),
                    ),
                  ]),
              //nhap fullname
              const Divider(
                color: Colors.grey,
              ),

              //nut dang ki
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Expanded(
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //       SharedPreferences pref =
                  //           await SharedPreferences.getInstance();
                  //       setState(() async {
                  //         await APIRepository().removeAccount(
                  //             pref.getString('accountID').toString(),
                  //             pref.getString('token').toString());
                  //       });
                  //     },
                  //     child: const Text(
                  //       "Xóa tài khoản",
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     style: const ButtonStyle(
                  //       backgroundColor: WidgetStatePropertyAll(
                  //           Color.fromRGBO(227, 34, 39, 1)),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _onUpdate();
                      },
                      child: const Text(
                        "Lưu thông tin",
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
    );
  }
}
