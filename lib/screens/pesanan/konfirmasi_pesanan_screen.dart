import 'package:admin/api/api_pesanan.dart';
import 'package:admin/models/model_paket_wedding.dart';
import 'package:admin/models/model_pesanan.dart';
import 'package:admin/providers/main_provider.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/utility/route_argument.dart';
import 'package:admin/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class KonfirmasiPesananScreen extends StatefulWidget {
  static const KEY = "/KonfirmasiPesananScreen";
  final RouteArgument<ModelPaketWedding> paketWedding;
  const KonfirmasiPesananScreen({
    Key? key,
    required this.paketWedding,
  }) : super(key: key);

  @override
  State<KonfirmasiPesananScreen> createState() => _KonfirmasiPesananScreenState();
}

class _KonfirmasiPesananScreenState extends State<KonfirmasiPesananScreen> {
  TextEditingController eNotes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var paketWedding = widget.paketWedding.passingData;
    var mainProvider = context.read<MainProvider>();
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
                          paketWedding.namaPaket,
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
                            controller: eNotes,
                            minLines: 3,
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Notes",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onTap: () async {
                      final request = BraintreeDropInRequest(
                        clientToken: 'sandbox_9qscg4sx_hy3cv2djtg9ph6xq',
                        collectDeviceData: true,
                        googlePaymentRequest: BraintreeGooglePaymentRequest(
                          totalPrice: paketWedding.totalHarga.toString(),
                          currencyCode: 'IDR',
                          billingAddressRequired: false,
                        ),
                        paypalRequest: BraintreePayPalRequest(
                          amount: paketWedding.totalHarga.toString(),
                          displayName: 'Bali Wedding',
                        ),
                      );

                      BraintreeDropInResult? result = await BraintreeDropIn.start(request);
                      if (result != null) {
                        ModelPesanan pesanan = ModelPesanan(id: 1, user: mainProvider.user!, paketWedding: paketWedding, notes: eNotes.text, createdAt: DateTime.now(), updatedAt: DateTime.now());
                        var createPesanan = await ApiPesanan.instance.createPesanan(pesanan);
                        if (createPesanan) {
                          EasyLoading.showSuccess("Successfully buy");
                          mainProvider.onSideBarItemTap(context, 1);
                          Navigator.popUntil(context, (ModalRoute.withName(MainScreen.KEY)));
                        } else {
                          EasyLoading.showError("Failed to buy");
                        }
                      } else {
                        EasyLoading.showError("Failed to buy");
                      }
                    },
                    title: "Yes, Buy!",
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
