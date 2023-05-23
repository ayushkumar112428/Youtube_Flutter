///main.dart///

import 'package:flutter/material.dart';
import 'package:mylibray/BottomBar.dart';
import 'package:mylibray/Home/homebody.dart';
import 'package:mylibray/Page/booksPage.dart';
import 'package:mylibray/Profile/profileBody.dart';
import 'package:mylibray/myhome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white70,
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        backgroundColor: Colors.white70,
        body: MyHomeBodyNew(),
        bottomNavigationBar: BottomNavBarNew(),
      ),
      initialRoute: 'home',
      routes: {
      'home':(context) => const MyHome(),
      'profile':(context) => const profileMyBody(),
      'book':(context)=> const MybooksPage(),
    },
    );
  }
}

///Bottombar.dart///

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:mylibray/Home/homebody.dart';
import 'package:mylibray/Library/librarybody.dart';
import 'package:mylibray/Profile/profileBody.dart';
import 'package:mylibray/Search/searchbody.dart';
import 'package:mylibray/colorstyle.dart';

class BottomNavBarNew extends StatefulWidget {
  const BottomNavBarNew({Key? key}) : super(key: key);

  @override
  State<BottomNavBarNew> createState() => _BottomNavBarNewState();
}

class _BottomNavBarNewState extends State<BottomNavBarNew> {
  int _selectedIndx = 0;
  TimeOfDay _timeofday = TimeOfDay.now();
  static final List<Widget> _widgetOption = <Widget>[
    const MyHomeBodyNew(),
    const searchMyBody(),
    const libraryMyBody(),
    const profileMyBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndx = index;
    });
  }

  void _showDateTime() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2003),
      lastDate: DateTime(2040),
    ).then((value) {
      setState(() {
        var _datetime = value;
      });
    });
  }

  void _showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      _timeofday = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.01,
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          "LIBRARY",
          style: text3,
        )),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _timeofday.format(context).toString(),
            style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
            ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: MaterialButton(
              onPressed: _showDateTime,
              child: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetOption[_selectedIndx],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.white,
        buttonBackgroundColor: Colors.transparent,
        onTap: _onItemTapped,
        animationDuration: Duration(milliseconds: 300),
        items: const [
          Icon(
            FluentSystemIcons.ic_fluent_home_regular,
            color: Colors.black,
          ),
          Icon(
            FluentSystemIcons.ic_fluent_search_regular,
            color: Colors.black,
          ),
          Icon(
            FluentSystemIcons.ic_fluent_book_formula_financial_filled,
            color: Colors.black,
          ),
          Icon(
            FluentSystemIcons.ic_fluent_person_regular,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}



///profileBody.dart///

import 'package:flutter/material.dart';
import 'package:mylibray/Profile/profilebodypart.dart';
import 'package:mylibray/Profile/profileheadpart.dart';
import 'package:mylibray/colorstyle.dart';

class profileMyBody extends StatelessWidget {
  const profileMyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.01,
      //   backgroundColor: Colors.white,
      //   title: const Center(child: Text("LIBRARY",style: text3,)),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            const Myimage(),
            const MyprofileBodypart(first: "Hobby", second: "Write, Read, Gameing, Song"),
            const MyprofileBodypart(first: "Interested Book Topic", second: "History, Leadership, Decision, Goals."),
            const MyprofileBodypart(first: "Favourite Book", second: "Bhagavat Gita, Mahabhart, Swamivibekananda."),
      
            Card(
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children:const [
                      Icon(Icons.logout, color: Colors.red,size: 27,),
                      SizedBox(width: 10,),
                      Text("Logout",style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}


///profilebodypart.dart///

import 'package:flutter/material.dart';
import 'package:mylibray/colorstyle.dart';

class MyprofileBodypart extends StatelessWidget {
  const MyprofileBodypart({Key? key, required this.first, required this.second})
      : super(key: key);
  final String first;
  final String second;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("  $first",style: text1,),
            const SizedBox(height: 2,),
            Text("  $second",style: text2,),
          ],
        ),
      ),
    );
  }
}


///profileheadpart.dart///

import 'package:flutter/material.dart';
import 'package:mylibray/colorstyle.dart';

class Myimage extends StatelessWidget {
  const Myimage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width * 0.49,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(65),
                        topRight: Radius.circular(65))),
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue,width: 3),
                                borderRadius: const BorderRadius.all(Radius.circular(60),
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset("assets/images/Profile003.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  child: Column(
                    children: const [
                      Text("User Name",style: text1,),
                      SizedBox(height: 5,),
                      Text("sub text",style: text2,)
                    ],
                  ),              
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: const[
                Icon(Icons.call),
                Text("   +91 1122334455",style: text2,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: const [
                Icon(Icons.email),
                Text("   library0123@gmail.com",style: text2,)
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
