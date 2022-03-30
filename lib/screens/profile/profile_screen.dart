import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const KEY = "/ProfileScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          elevation: 1,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.white,
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
                          margin: EdgeInsets.only(top: 100),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: ExtendedImage.network(
                                  "https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?size=626&ext=jpg&ga=GA1.2.1411842976.1640908800",
                                  fit: BoxFit.cover,
                                  cache: true,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Adi Sanjaya",
                                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
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
                                decoration: InputDecoration(border: InputBorder.none, hintText: "Nama", hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                decoration: InputDecoration(border: InputBorder.none, hintText: "Email", hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                decoration: InputDecoration(border: InputBorder.none, hintText: "Alamat", hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                decoration: InputDecoration(border: InputBorder.none, hintText: "Telp", hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: Center(
                            child: Text(
                              "Update Profile",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
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
