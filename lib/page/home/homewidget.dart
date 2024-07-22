import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_didongnangcao/page/home/home_list.dart';
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
                HomeBuilder(),
                
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
