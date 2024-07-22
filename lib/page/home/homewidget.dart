import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';

class Homewidget extends StatefulWidget {
  const Homewidget({super.key});

  @override
  State<Homewidget> createState() => _HomewidgetState();
}

class _HomewidgetState extends State<Homewidget> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE-lHvVq6jyVbHY74cXBWRcJqB_QBlKVz7KQ&s",
    "https://pasgo.vn/nha-hang/the-log-gem-center-1588",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz6RDOx_2bRkTF552k-eOOTv8WPFwHtQiGCg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE6gy6yp6B3MvYMRhmHBFzVlCa_avgdRqQ8w&s",
  ];

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
                Text("Trang Chủ"),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Tìm kiếm',
                //     hintText: 'Tìm kiếm...',
                //     prefixIcon: Icon(Icons.search),
                //     filled: true, // Bật nền cho trường
                //     fillColor: Colors.white, // Màu nền
                //     contentPadding:
                //         EdgeInsets.all(16.0), // Khoảng cách nội dung
                //     border: OutlineInputBorder(
                //       borderRadius:
                //           BorderRadius.circular(20.0), // Bo tròn các góc
                //     ),
                //   ),
                // ),

                //nhap fullname
                const SizedBox(height: 16),
                // CarouselSlider.builder(
                //     carouselController: controller,
                //     itemCount: urlImages.length,
                //     itemBuilder: (context, index, realIndex) {
                //       final urlImage = urlImages[index];
                //       return buildImage(urlImage, index);
                //     },
                //     options: CarouselOptions(
                //         height: 200,
                //         autoPlay: true,
                //         enableInfiniteScroll: false,
                //         autoPlayAnimationDuration: Duration(seconds: 2),
                //         enlargeCenterPage: true,
                //         onPageChanged: (index, reason) =>
                //             setState(() => activeIndex = index))),
                // SizedBox(height: 12),
                // buildIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) =>
    Container(child: Image.network(urlImage, fit: BoxFit.cover));
