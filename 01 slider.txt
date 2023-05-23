import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: _imgURl.map((imgpath) {
        return Builder(builder: (BuildContext context) {
          return GestureDetector(
            onDoubleTap: () {},
            child: Container(
              // width: MediaQuery.of(context).size.width*1.2,
              height: 140,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                  offset: const Offset(5.0,5.0),
                  blurRadius: 15,
                  spreadRadius: 15,
                  color: Colors.grey.shade200,
                )],
                /*image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imgpath,)
                  ),*/
              ),
              child: Card(child: Image.asset(imgpath,height: 100,fit: BoxFit.fill,width: MediaQuery.of(context).size.width*0.9,)),
              // child: Image(image: AssetImage(imgpath)),
            ),
          );
        });
      }).toList(),
    );
  }
  final List _imgURl = [
    'assets/images/image101.jpg',
    'assets/images/image102.jpg',
    'assets/images/image103.jpg',
    'assets/images/image104.jpg',
    'assets/images/image105.jpg',
    'assets/images/image106.jpg',
  ];
}