import 'dart:io';

import 'package:admin/api/api_user.dart';
import 'package:admin/providers/main_provider.dart';
import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/utility/session_manager.dart';
import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const KEY = "/ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var mainProvider;
  TextEditingController eName = TextEditingController();
  TextEditingController eEmail = TextEditingController();
  TextEditingController eAlamat = TextEditingController();
  TextEditingController eTelp = TextEditingController();

  @override
  void initState() {
    mainProvider = context.read<MainProvider>();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (mainProvider.user != null) {
        mainProvider.updateUser = mainProvider.user;
        eName.text = mainProvider.user!.name;
        eEmail.text = mainProvider.user!.email;
        eAlamat.text = mainProvider.user!.alamat ?? "";
        eTelp.text = mainProvider.user!.noHp;
      }
    });
    super.initState();
  }

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
            child: Consumer<MainProvider>(builder: (context, mainProvider, _) {
              return Column(
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
                                GestureDetector(
                                  onTap: () async {
                                    await FilePicker.platform.pickFiles(type: FileType.image).then((value) async {
                                      if (value != null) {
                                        var path = value.files.single.path;
                                        if (path != null) {
                                          await ApiUser.instance.putProfileImage(File(path), mainProvider.user!.id.toString());
                                          var user = await ApiUser.instance.getUser(mainProvider.user!.email);
                                          EasyLoading.dismiss();
                                          if (user != null) {
                                            SessionManager.instance.setUser(user);
                                            mainProvider.setUpdateUser(user);
                                          }
                                        }
                                      }
                                    });
                                  },
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: ExtendedImage.network(
                                      mainProvider.user!.image ?? "",
                                      fit: BoxFit.cover,
                                      cache: true,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    mainProvider.user!.name,
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
                                  controller: eName,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) mainProvider.updateUser!.name = value;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nama",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: eEmail,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) mainProvider.updateUser!.email = value;
                                  },
                                  decoration: InputDecoration(border: InputBorder.none, hintText: "Email", hintStyle: TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: eAlamat,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) mainProvider.updateUser!.alamat = value;
                                  },
                                  decoration: InputDecoration(border: InputBorder.none, hintText: "Alamat", hintStyle: TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: eTelp,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) mainProvider.updateUser!.noHp = value;
                                  },
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
                          onTap: () async {
                            bool update = await ApiUser.instance.updateUser(mainProvider.updateUser!);
                            if (update) {
                              EasyLoading.showSuccess("Successfully updated");
                              EasyLoading.show(status: "Loading...");
                              await SessionManager.instance.logout();
                              EasyLoading.dismiss();
                              Navigator.pushReplacementNamed(context, LoginScreen.KEY);
                            } else {
                              EasyLoading.showError("Failed to update user");
                            }
                          },
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
              );
            }),
          ),
        ));
  }
}
