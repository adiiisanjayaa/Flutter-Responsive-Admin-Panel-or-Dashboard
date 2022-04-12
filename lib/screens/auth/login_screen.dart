import 'package:admin/providers/main_provider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/auth/register_screen.dart';
import 'package:admin/utility/assets.dart';
import 'package:admin/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  static const KEY = "/LoginScreen";
  @override
  Widget build(BuildContext context) {
    var mainProvider = context.read<MainProvider>();
    TextEditingController eEmail = TextEditingController();
    TextEditingController ePass = TextEditingController();
    return Scaffold(
        // backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: Responsive.isMobile(context)
                  ? BoxDecoration(
                      image: DecorationImage(image: AssetImage(Assets.bgForm), fit: BoxFit.fill),
                    )
                  : null,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.bgLight1))),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.bgLight2))),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.bgClock))),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: Responsive.isMobile(context) ? null : 50.w,
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
                            controller: eEmail,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email or Phone number",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: ePass,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
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
                      if (eEmail.text.isNotEmpty && ePass.text.isNotEmpty) {
                        mainProvider.login(context, eEmail.text, ePass.text);
                      } else {
                        EasyLoading.showError("Email and Password must be filled");
                      }
                    },
                    title: "Login",
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RegisterScreen.KEY);
                    },
                    child: Text(
                      "Register",
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
