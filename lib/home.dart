import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);
  @override
  _login_page_State createState() => _login_page_State();
}

class _login_page_State extends State<home_page> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late bool obscureText;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<CoolDropdownItem<String>> dropdownItemList = [];
  List<String> namakereta = ['kamandaka', 'Turangga', 'Sancaka'];
  List<String> kelaskereta = [
    'Eksekutif',
    'Bisnis',
    'Ekonomi',
  ];
  List<String> Usia = [
    'Dewasa',
    'Anak Anak',
    'Lansia',
  ];

  List<CoolDropdownItem<String>> kelasDropdownItems = [];
  List<CoolDropdownItem<String>> usiaDropdownItems = [];
  List<CoolDropdownItem<String>> fruitDropdownItems = [];

  final fruitDropdownController = DropdownController();
  final kelasDropdownController = DropdownController();
  final usiaDropdownController = DropdownController();
  final pokemonDropdownController = DropdownController();
  final listDropdownController = DropdownController();
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    for (var i = 0; i < namakereta.length; i++) {
      fruitDropdownItems.add(CoolDropdownItem<String>(
          label: '${namakereta[i]}',
          icon: Container(
            margin: EdgeInsets.only(left: 10),
            height: 25,
            width: 25,
          ),
          selectedIcon: Container(
            margin: EdgeInsets.only(left: 10),
            height: 25,
            width: 25,
          ),
          value: '${namakereta[i]}'));
    }

    for (var i = 0; i < kelaskereta.length; i++) {
      kelasDropdownItems.add(CoolDropdownItem<String>(
          label: '${kelaskereta[i]}',
          icon: Container(
            margin: EdgeInsets.only(left: 10),
            height: 25,
            width: 25,
          ),
          selectedIcon: Container(
            margin: EdgeInsets.only(left: 10),
            height: 25,
            width: 25,
          ),
          value: '${kelaskereta[i]}'));
    }

    for (var i = 0; i < Usia.length; i++) {
      usiaDropdownItems.add(CoolDropdownItem<String>(
          label: '${Usia[i]}',
          icon: Container(
            margin: EdgeInsets.only(left: 10),
            height: 25,
            width: 25,
          ),
          selectedIcon: Container(
            margin: EdgeInsets.only(left: 10),
            height: 25,
            width: 25,
          ),
          value: '${Usia[i]}'));
    }
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
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 240, 240),
                    image: DecorationImage(
                        image: AssetImage('assets/images/persero.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.87,
                  alignment: AlignmentDirectional.bottomStart,
                  padding:
                      EdgeInsets.only(top: 30, left: 5, right: 5, bottom: 10),
                  child: Text(
                    "Pembelian Tiket Kereta Api",
                    style: TextStyle(fontSize: 20, fontFamily: 'gotham'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Nama Kereta",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 50,
                      child: CoolDropdown(
                        dropdownList: fruitDropdownItems,
                        controller: fruitDropdownController,
                        onChange: (value) async {
                          if (fruitDropdownController.isError) {
                            await fruitDropdownController.resetError();
                          }
                          // fruitDropdownController.close();
                        },
                        onOpen: (value) {},
                        resultOptions: ResultOptions(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 200,
                          icon: const SizedBox(
                            width: 10,
                            height: 10,
                            child: CustomPaint(
                              painter: DropdownArrowPainter(),
                            ),
                          ),
                          render: ResultRender.all,
                          placeholder: 'Pilih Nama Kereta',
                          isMarquee: true,
                        ),
                        dropdownOptions: DropdownOptions(
                            top: 20,
                            height: 400,
                            gap: DropdownGap.all(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            align: DropdownAlign.left,
                            animationType: DropdownAnimationType.size),
                        dropdownTriangleOptions: DropdownTriangleOptions(
                          width: 20,
                          height: 30,
                          align: DropdownTriangleAlign.left,
                          borderRadius: 3,
                          left: 20,
                        ),
                        dropdownItemOptions: DropdownItemOptions(
                          isMarquee: true,
                          mainAxisAlignment: MainAxisAlignment.start,
                          render: DropdownItemRender.all,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Kelas Kereta",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 50,
                      child: CoolDropdown(
                        dropdownList: kelasDropdownItems,
                        controller: kelasDropdownController,
                        onChange: (value) async {
                          if (kelasDropdownController.isError) {
                            await kelasDropdownController.resetError();
                          }
                          // fruitDropdownController.close();
                        },
                        onOpen: (value) {},
                        resultOptions: ResultOptions(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 200,
                          icon: const SizedBox(
                            width: 10,
                            height: 10,
                            child: CustomPaint(
                              painter: DropdownArrowPainter(),
                            ),
                          ),
                          render: ResultRender.all,
                          placeholder: 'Pilih Kelas Kereta',
                          isMarquee: true,
                        ),
                        dropdownOptions: DropdownOptions(
                            top: 20,
                            height: 400,
                            gap: DropdownGap.all(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            align: DropdownAlign.left,
                            animationType: DropdownAnimationType.size),
                        dropdownTriangleOptions: DropdownTriangleOptions(
                          width: 20,
                          height: 30,
                          align: DropdownTriangleAlign.left,
                          borderRadius: 3,
                          left: 20,
                        ),
                        dropdownItemOptions: DropdownItemOptions(
                          isMarquee: true,
                          mainAxisAlignment: MainAxisAlignment.start,
                          render: DropdownItemRender.all,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Usia",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 50,
                      child: CoolDropdown(
                        dropdownList: usiaDropdownItems,
                        controller: usiaDropdownController,
                        onChange: (value) async {
                          if (usiaDropdownController.isError) {
                            await usiaDropdownController.resetError();
                          }
                          // fruitDropdownController.close();
                        },
                        onOpen: (value) {},
                        resultOptions: ResultOptions(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 200,
                          icon: const SizedBox(
                            width: 10,
                            height: 10,
                            child: CustomPaint(
                              painter: DropdownArrowPainter(),
                            ),
                          ),
                          render: ResultRender.all,
                          placeholder: 'Pilih Usia Anda',
                          isMarquee: true,
                        ),
                        dropdownOptions: DropdownOptions(
                            top: 20,
                            height: 400,
                            gap: DropdownGap.all(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            align: DropdownAlign.left,
                            animationType: DropdownAnimationType.size),
                        dropdownTriangleOptions: DropdownTriangleOptions(
                          width: 20,
                          height: 30,
                          align: DropdownTriangleAlign.left,
                          borderRadius: 3,
                          left: 20,
                        ),
                        dropdownItemOptions: DropdownItemOptions(
                          isMarquee: true,
                          mainAxisAlignment: MainAxisAlignment.start,
                          render: DropdownItemRender.all,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Jumlah",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
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
                                      label: Text("Jumlah"),
                                      labelStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 141, 140, 140)),
                                      contentPadding: EdgeInsets.all(2),
                                    ),
                                    keyboardType: TextInputType.number,
                                  )),
                                ),
                              ],
                            )))
                  ],
                ),
                // Container(
                //     width: MediaQuery.of(context).size.width * 0.87,
                //     margin: const EdgeInsets.symmetric(horizontal: 10),
                //     child: Material(
                //         color: Colors.white,
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(5)),
                //         elevation: 2,
                //         child: Row(
                //           children: <Widget>[
                //             Expanded(
                //               child: Center(
                //                   child: TextFormField(
                //                 textAlign: TextAlign.start,
                //                 decoration: const InputDecoration(
                //                   // hintText: 'Password',
                //                   label: Text("password"),
                //                   labelStyle: TextStyle(
                //                       color:
                //                           Color.fromARGB(255, 141, 140, 140)),
                //                   prefixIcon: Icon(Icons.lock_open_rounded,
                //                       color: Color.fromARGB(255, 4, 113, 255)),
                //                   border: InputBorder.none,
                //                   contentPadding: EdgeInsets.all(2),
                //                   fillColor: Color.fromARGB(255, 245, 240, 225),
                //                   filled: true,
                //                 ),
                //                 keyboardType: TextInputType.text,
                //                 controller: passwordController,
                //                 obscureText: obscureText,
                //               )),
                //             ),
                //             Container(
                //               color: Color.fromARGB(255, 245, 240, 225),
                //               child: IconButton(
                //                 icon: Icon(
                //                   Icons.remove_red_eye,
                //                   color: !obscureText
                //                       ? Colors.black.withOpacity(0.3)
                //                       : Colors.black,
                //                 ),
                //                 onPressed: () {
                //                   setState(() {
                //                     obscureText = !obscureText;
                //                   });
                //                 },
                //               ),
                //             )
                //           ],
                //         ))),
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
                      child: const Text("Beli",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18)),
                      color: Color.fromARGB(255, 253, 156, 11),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: const EdgeInsets.all(10),
                    )),
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
      passwordController.clear();
      emailController.clear();
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
