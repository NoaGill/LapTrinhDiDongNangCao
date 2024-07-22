import 'package:flutter/material.dart';

class OrderWidhet extends StatefulWidget {
  const OrderWidhet({super.key});

  @override
  State<OrderWidhet> createState() => _OrderWidhetState();
}

class _OrderWidhetState extends State<OrderWidhet> {
  final TextEditingController _birthdayController = TextEditingController();
  TextEditingController _personController = TextEditingController();
  TextEditingController _childController = TextEditingController();
  Future<void> _selecteDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (_picked != null) {
      setState(() {
        _birthdayController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, // Thay đổi màu ở đây
          ),
          title: const Text(
            "Triangle",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Color.fromRGBO(227, 34, 39, 1)),
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
                    "Ẩm thực quê nhà",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(227, 34, 39, 1)),
                  ),
                ),
                Text("Thông tin đặt chổ"),
                const SizedBox(height: 16),
                Row(
                    // Sắp xếp các widget con cách đều nhau
                    children: [
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.person_outline,
                              size: 24.0,
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Số người lớn: "))),
                      // Expanded(flex: 1, child: ElevatedButton(
                      //   onPressed: () {
                      //     var kq = int.parse(_personController.toString())+1;
                      //     _personController.text =  "1";
                      //   },
                      //   child: const Text(
                      //     "+",
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   style: const ButtonStyle(
                      //     backgroundColor: WidgetStatePropertyAll(
                      //         Color.fromRGBO(227, 34, 39, 1)),
                      //   ),
                      // ),),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _personController,
                          decoration: InputDecoration(
                            filled: true, // Bật nền cho trường
                            fillColor: Colors.white, // Màu nền
                            contentPadding:
                                EdgeInsets.all(15.0), // Khoảng cách nội dung
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Bo tròn các góc
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      // Expanded(flex: 1, child: ElevatedButton(

                      //   onPressed: () {
                      //     // Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(
                      //     //       builder: (context) => Changeinfowidget()),
                      //     // );
                      //   },
                      //   child: const Text(
                      //     "-",
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   style: const ButtonStyle(
                      //     backgroundColor: WidgetStatePropertyAll(
                      //         Color.fromRGBO(227, 34, 39, 1)),
                      //   ),
                      // ),),
                    ]),
                //nhap fullname
                const Divider(
                  color: Colors.grey,
                  height: 10,
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
                              Icons.child_friendly_outlined,
                              size: 24.0,
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Số trẻ em"))),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _childController,
                          decoration: InputDecoration(
                            filled: true, // Bật nền cho trường
                            fillColor: Colors.white, // Màu nền
                            contentPadding:
                                EdgeInsets.all(15.0), // Khoảng cách nội dung
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Bo tròn các góc
                            ),
                          ),
                          keyboardType: TextInputType.number,
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
                              Icons.calendar_month_outlined,
                              size: 24.0,
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Ngày đến"))),
                      Expanded(
                        flex: 6,
                        child: TextFormField(
                          controller: _birthdayController,
                          decoration: InputDecoration(
                            labelText: '',
                            hintText: '',
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
                          onTap: () {
                            _selecteDate();
                          },
                          keyboardType: TextInputType.number,
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
                              Icons.note_outlined,
                              size: 24.0,
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Ghi chú"))),
                      Expanded(
                          flex: 6,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: '',
                              hintText: 'Nhập ghi chú của bạn',
                              filled: true, // Bật nền cho trường
                              fillColor: Colors.white, // Màu nền
                              contentPadding:
                                  EdgeInsets.all(15.0), // Khoảng cách nội dung
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Bo tròn các góc
                              ),
                            ),
                          ))
                    ]),
                //nhap fullname
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text("Thông tin khách hàng"),
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
                              child: Text("Tên người dùng"))),
                      Expanded(
                          flex: 6,
                          child: Text(
                            "Lê Hữu Bền",
                            textAlign: TextAlign.start,
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
                              child: Text("Số điện thoại"))),
                      Expanded(
                          flex: 6,
                          child: Text(
                            "0367703344",
                            textAlign: TextAlign.start,
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
                              child: Text("Email"))),
                      Expanded(
                          flex: 6,
                          child: Text(
                            "lehuuben@gmail.com",
                            textAlign: TextAlign.start,
                          )),
                    ]),
                //nhap fullname

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
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Đặt bàn thành công!"),
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Tiếp tục",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(227, 34, 39, 1)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
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
