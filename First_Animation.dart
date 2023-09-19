import 'package:flutter/material.dart';
import 'animation/animation1.dart';

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
      home: const AnimationPart1(),
    );
  }
}

// animation
import 'package:flutter/material.dart';

class AnimationPart1 extends StatefulWidget {
  const AnimationPart1({super.key});

  @override
  State<AnimationPart1> createState() => _AnimationPart1State();
}

class _AnimationPart1State extends State<AnimationPart1> {
  double _width = 200;
  double _hight = 200;
  Color _color = Colors.blue;

  _updateState() {
    setState(() {
      _width = 400;
      _hight = 400;
      _color = Colors.red;
    });
  }

  _ripit() {
    setState(() {
      _width = 200;
      _hight = 200;
      _color = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  _updateState();
                },
                child: const Text('Animation'),
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  _ripit();
                },
                child: const Text('Animation'),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceInOut,
                width: _width,
                height: _hight,
                color: _color,
                child: Center(
                    child: Text(
                  "Animation",
                  style: Theme.of(context).textTheme.headlineLarge,
                )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
