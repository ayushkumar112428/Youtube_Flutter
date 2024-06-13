import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {
  SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Slider Screen")),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 220,
                autoPlay: false,
                reverse: false,
                autoPlayInterval: const Duration(seconds: 1),
                autoPlayAnimationDuration: const Duration(seconds: 1)),
            items: _items.map((imgpath) {
              return Builder(builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreens()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 2),
                            color: Colors.grey,
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                        ],
                        image: DecorationImage(
                            image: AssetImage(imgpath), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }

  final List<String> _items = [
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image5.jpg',
    'assets/image5.jpg',
    'assets/image5.jpg',
  ];
}

