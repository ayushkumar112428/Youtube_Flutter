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
        "/": (context) => LoginScreenSTL(),
        "/next": (context) => nextpage(),
      },
    );
  }
}

class LoginScreenSTL extends StatelessWidget {
  LoginScreenSTL({Key? key}) : super(key: key);
  TextEditingController _userController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loginButtonEnabled = false;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "WELOCME $name",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(198, 68, 127, 255)),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                    labelText: 'User name',
                    hintText: "Enter th User Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    icon: Icon(Icons.man_rounded),
                  ),
                  onChanged: (value) {
                    name = value;
                    // setState(() {});
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (_) {
                    return !_userController.text.isNotEmpty
                        ? 'Enter user Name'
                        : null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: "Enter th Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    icon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (_) {
                    return !_emailController.text.contains('@')
                        ? 'Invalid email'
                        : null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: "Enter THe Password.",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (_) {
                    return _passwordController.text.length < 6
                        ? 'Invalid password'
                        : null;
                  },
                ),
                SizedBox(height: 45),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: RaisedButton(
                    elevation: 0,
                    autofocus: true,
                    color: Colors.blue, // background
                    textColor: Colors.white, // foreground
                    splashColor: Colors.white12,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => nextpage()));
                      } else {
                        return null;
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
                // RaisedButton(
                //   color: Colors.red, // background
                //   textColor: Colors.white, // foreground
                //   onPressed: () {
                //     if (_loginButtonEnabled) {
                //       _onLoginButtonPressed(context);
                //     } else {
                //       return null;
                //     }
                //   },
                //   child: Text('Login'),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     if (_loginButtonEnabled) {
                //       _onLoginButtonPressed(context);
                //     } else {
                //       return null;
                //     }
                //   },
                //   child: Text('Login'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _onLoginButtonPressed(contex) {
  //   if (_formKey.currentState!.validate()) {
  //     // Navigator.pushNamed(context, 'nextpage');
  //     Navigator.push(contex, MaterialPageRoute(builder: (context) => nextpage()));
  //     // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextpage()));
  //   }
  // }
}