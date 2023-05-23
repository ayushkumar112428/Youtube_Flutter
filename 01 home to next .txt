//Home page..................

import 'package:flutter/material.dart';
import 'package:flutter_app_part1/next_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      // initialRoute: "/next",
      routes: {
        "/": (context) => MyHomePage(),
        "/next": (context) => nextpage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/next');
            // Navigator.push(context, MaterialPageRoute(builder: (context) => nextpage()));
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextpage()));
          },
          child: Text("Next"),
        ),
      ),
    );
  }
}

//Next page..............

import 'package:flutter/material.dart';

class nextpage extends StatelessWidget {
  const nextpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Next Page")),
      ),
      body: Container(
        child: Center(child: Text("Next Page",style: TextStyle(fontSize: 40),)),
      ),
    );
  }
}
