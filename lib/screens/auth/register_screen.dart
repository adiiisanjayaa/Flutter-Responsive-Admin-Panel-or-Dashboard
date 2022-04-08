import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const KEY = "/RegisterScreen";
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
            Padding(
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
                            decoration: InputDecoration(border: InputBorder.none, hintText: "Email or Phone number", hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                          child: TextField(
                            decoration: InputDecoration(border: InputBorder.none, hintText: "Email or Phone number", hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                          child: TextField(
                            decoration: InputDecoration(border: InputBorder.none, hintText: "Email or Phone number", hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(border: InputBorder.none, hintText: "Password", hintStyle: TextStyle(color: Colors.grey[400])),
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
                      Navigator.pushReplacementNamed(context, MainScreen.KEY);
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
            )
          ],
        ),
      ),
    ));
  }
}
