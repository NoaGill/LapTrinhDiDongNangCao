import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_didongnangcao/page/detail/detail.dart';

class ReccomendList extends StatelessWidget {
  const ReccomendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: const Text(
            "Nhà hàng gần bạn",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(250, 249, 249, 1)),
          ),
        ),
        //email
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/amthucquenha.png",
                    width: 125, height: 125),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Ẩm Thực Quê Nhà",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text("28 Phạm Ngọc Thạch, P6, Q3"),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurentScreen()),
                        );
                      },
                      child: const Text(
                        "Đặt bàn ngay",
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(227, 34, 39, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Image.asset(
                  "assets/images/heart.png",
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/gemcenter.png",
                    width: 125, height: 125),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("The LOG - GemCT",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text("8 N.B.K, P Đa Kao, Q1"),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Đặt bàn ngay",
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(227, 34, 39, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Image.asset(
                  "assets/images/heart.png",
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/lacthai.png",
                    width: 125, height: 125),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Lạc Thái 7",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text("48 Bis Xuân Thủy, P T.D, Q2"),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Đặt bàn ngay",
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(227, 34, 39, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Image.asset(
                  "assets/images/heart.png",
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/sanfulou.png",
                    width: 125, height: 125),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("San Fu Lou 1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text("76A Lê Lai, P Bến Nghé, Q1"),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Đặt bàn ngay",
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(227, 34, 39, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Image.asset(
                  "assets/images/heart.png",
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}