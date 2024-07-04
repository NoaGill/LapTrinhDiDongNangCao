import 'package:flutter/material.dart';
// import 'package:restaurant_booking_app/Model/mode.dart';
// import 'package:restaurant_booking_app/Utils/colors.dart';

class RestaurentScreen extends StatelessWidget {
  const RestaurentScreen({super.key});
  //final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // for image
          Hero(
            tag: Image.asset("assets/images/amthucquenha.png"),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/anhtc/que-nha-pnt/nha-hang-que-nha-pham-ngoc-thach-2.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          // for back or close button
          Positioned(
            top: 50,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white38,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(227, 34, 39, 1),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: const Text(
                    "NoA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                // for name
                Text(
                  "Âm Thực Quê Nhà",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          // user(150, "assets/images/amthucquenha", context),
          // user(125, "assets/images/gemcenter", context),
          // user(100, "assets/images/lacthai", context),
          // user(75, "assets/images/sanfulou", context),
          // user(50, "assets/images/amthucquenha", context),
          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.48,
          //   left: 30,
          //   child: Container(
          //     height: 46,
          //     width: 46,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       shape: BoxShape.circle,
          //       border: Border.all(width: 1, color: Colors.white),
          //     ),
          //     child: const Center(
          //       child: Text(
          //         "4.3",
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.52,
            left: 30,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Đánh giá",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 125,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage("https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/anhtc/que-nha-pnt/nha-hang-que-nha-pham-ngoc-thach-2.jpg"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tuyệt cà là vời..",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1,
                                  child: Text(
                                    "xuất sắc luôn..",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 125,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage("https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/anhtc/que-nha-pnt/nha-hang-que-nha-pham-ngoc-thach-2.jpg"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tuyệt cà là vời..",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1,
                                  child: Text(
                                    "xuất sắc luôn..",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 125,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage("https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/anhtc/que-nha-pnt/nha-hang-que-nha-pham-ngoc-thach-2.jpg"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tuyệt cà là vời..",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1,
                                  child: Text(
                                    "xuất sắc luôn..",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 125,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage("https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/anhtc/que-nha-pnt/nha-hang-que-nha-pham-ngoc-thach-2.jpg"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tuyệt cà là vời..",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1,
                                  child: Text(
                                    "xuất sắc luôn..",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned user(double leftPosition, String image, BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.48,
      left: leftPosition,
      child: Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Colors.white),
        ),
      ),
    );
  }
}
