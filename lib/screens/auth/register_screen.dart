import 'package:admin/providers/main_provider.dart';
import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const KEY = "/RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String pickJenisKelamin = "Pria";
  late MainProvider mainProvider;
  var jenisKelamin = [
    'Pria',
    'Wanita',
  ];

  @override
  void initState() {
    mainProvider = context.read<MainProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-1.png'))),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-2.png'))),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/clock.png'))),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Consumer<MainProvider>(builder: (context, mainProvider, _) {
              return Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) mainProvider.register.name = value.toString();
                              },
                              decoration: InputDecoration(border: InputBorder.none, hintText: "Name", hintStyle: TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) mainProvider.register.email = value.toString();
                              },
                              decoration: InputDecoration(border: InputBorder.none, hintText: "Email", hintStyle: TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) mainProvider.register.telp = value.toString();
                              },
                              decoration: InputDecoration(border: InputBorder.none, hintText: "Phone number", hintStyle: TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                            child: DropdownButton(
                              underline: Container(),
                              isExpanded: true,
                              value: pickJenisKelamin,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: jenisKelamin.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null)
                                  setState(() {
                                    mainProvider.register.kelamin = newValue.toString();

                                    pickJenisKelamin = newValue;
                                  });
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                            child: TextField(
                              obscureText: true,
                              onChanged: (value) {
                                if (value.isNotEmpty) mainProvider.register.pass = value.toString();
                              },
                              decoration: InputDecoration(border: InputBorder.none, hintText: "Password", hintStyle: TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) mainProvider.register.rePass = value.toString();
                              },
                              obscureText: true,
                              decoration: InputDecoration(border: InputBorder.none, hintText: "Re-type Password", hintStyle: TextStyle(color: Colors.grey[400])),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      onTap: () async {
                        if (mainProvider.register.pass != mainProvider.register.rePass) {
                          EasyLoading.showError("Passwords do not match");
                        } else {
                          if (mainProvider.register.kelamin == null) {
                            mainProvider.register.kelamin = pickJenisKelamin;
                          }
                          bool regis = await mainProvider.registerUser();
                          if (regis) {
                            Navigator.pushReplacementNamed(context, LoginScreen.KEY);
                          }
                        }
                      },
                      title: "Register",
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.KEY);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    ));
  }
}
