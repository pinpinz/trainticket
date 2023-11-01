import 'dart:convert';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keretaapi/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';

class login_page_ extends StatefulWidget {
  const login_page_({Key? key}) : super(key: key);
  @override
  _login_page_State createState() => _login_page_State();
}

class _login_page_State extends State<login_page_> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late bool obscureText;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    super.initState();
    obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
              // color :Color.fromARGB(255, 247, 240, 240),
              // image: DecorationImage(
              //     image: AssetImage('assets/images/backgroundasd.jpeg'),
              //     fit: BoxFit.fitWidth),

              ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  //  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.height * 0.2),

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login/header.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.87,
                  alignment: AlignmentDirectional.bottomStart,
                  padding:
                      EdgeInsets.only(top: 30, left: 5, right: 5, bottom: 10),
                  child: Text(
                    "HI Kerete Api Mania",
                    style: TextStyle(fontSize: 20, fontFamily: 'gotham'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.87,
                  alignment: AlignmentDirectional.bottomStart,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text("Sign in to continue",
                      style: TextStyle(fontSize: 14, fontFamily: 'gotham')),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.87,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: <Widget>[
                      Container(
                        child: Material(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            elevation: 2,
                            child: Center(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.people_sharp,
                                      color: Color.fromARGB(255, 4, 113, 255)),
                                  fillColor: Color.fromARGB(255, 245, 240, 225),
                                  filled: true,
                                  // hintText: 'insert Username here',
                                  label: Text("Username"),
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 141, 140, 140)),

                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(2),
                                ),
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            )),
                      ),
                    ])),
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.87,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Material(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        elevation: 2,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                  child: TextFormField(
                                textAlign: TextAlign.start,
                                decoration: const InputDecoration(
                                  // hintText: 'Password',
                                  label: Text("password"),
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 141, 140, 140)),
                                  prefixIcon: Icon(Icons.lock_open_rounded,
                                      color: Color.fromARGB(255, 4, 113, 255)),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(2),
                                  fillColor: Color.fromARGB(255, 245, 240, 225),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.text,
                                controller: passwordController,
                                obscureText: obscureText,
                              )),
                            ),
                            Container(
                              color: Color.fromARGB(255, 245, 240, 225),
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: !obscureText
                                      ? Colors.black.withOpacity(0.3)
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                              ),
                            )
                          ],
                        ))),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: MaterialButton(
                      onPressed: () {
                        loginValidation(context);
                      },
                      child: const Text("Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18)),
                      color: Color.fromARGB(255, 253, 156, 11),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: const EdgeInsets.all(10),
                    )),

                // Expanded(
                //   child: Container(),
                // ),
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: AlignmentDirectional.center,
                    child: TextButton(
                        onPressed: () async {},
                        child: Text(" - Term and conditions -",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 51, 50, 50))))),
              ],
            ),
          ),
        ));
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  void loginValidation(BuildContext context) async {
    bool isLoginValid = true;
    FocusScope.of(context).requestFocus(FocusNode());

    if (emailController.text.isEmpty) {
      isLoginValid = false;
      _onWidgetDidBuild(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Username Tidak Boleh Kosong'),
            backgroundColor: Colors.red,
          ),
        );
        passwordController.clear();
        emailController.clear();
      });
    }

    if (passwordController.text.isEmpty) {
      isLoginValid = false;
      _onWidgetDidBuild(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password Tidak Boleh Kosong'),
            backgroundColor: Colors.red,
          ),
        );
        passwordController.clear();
        emailController.clear();
      });
    }
    if (isLoginValid) {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const home_page(),
        ),
      );
      // passwordController.clear();
      // emailController.clear();
    }
  }

  BuildContext? dialogContext;
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Sign in...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        dialogContext = context;
        return alert;
      },
    );
  }

  hideLoaderDialog(BuildContext? context) {
    if (context != null) {
      return Navigator.pop(context);
    }
  }
}
