import 'package:admin/models/model_paket_wedding.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/paket_wedding/preview_image_screen.dart';
import 'package:admin/screens/pesanan/konfirmasi_pesanan_screen.dart';
import 'package:admin/utility/constants.dart';
import 'package:admin/utility/helpers.dart';
import 'package:admin/utility/route_argument.dart';
import 'package:admin/widgets/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:sizer/sizer.dart';

class DetailPaketWeddingScreen extends StatefulWidget {
  static const KEY = "/DetailPaketWeddingScreen";

  const DetailPaketWeddingScreen({Key? key, required this.paketWedding}) : super(key: key);

  final RouteArgument<ModelPaketWedding> paketWedding;

  @override
  _DetailPaketWeddingScreenState createState() => _DetailPaketWeddingScreenState();
}

class _DetailPaketWeddingScreenState extends State<DetailPaketWeddingScreen> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // var weddingProvider = Provider.of<WeddingPaketProvider>(context, listen: false);
    var paketWedding = widget.paketWedding.passingData;
    MoneyFormatter total = new MoneyFormatter(
      amount: paketWedding.totalHarga.toDouble(),
      settings: MoneyFormatterSettings(
        symbol: 'IDR',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 3,
        compactFormatType: CompactFormatType.short,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // toolbarHeight: getProportionateScreenWidth(0),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                    primary: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, PreviewImagePage.KEY, arguments: RouteArgument<String>(passingData: paketWedding.image ?? ""));
                          },
                          child: ExtendedImage.network(
                            paketWedding.image ?? "",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: Responsive.isDesktop(context) ? 40.h : null,
                            cache: true,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 3.sp),
                                    decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(10.sp),
                                    ),
                                    child: Text(
                                      paketWedding.status.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    Helpers.dateFormater(paketWedding.createdAt),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.sp),
                              Text(
                                paketWedding.namaPaket,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Text(
                                paketWedding.keterangan,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 20.sp),
                              CarouselSlider(
                                carouselController: _controller,
                                options: CarouselOptions(
                                    initialPage: 0,
                                    autoPlay: true,
                                    reverse: false,
                                    enableInfiniteScroll: true,
                                    autoPlayInterval: Duration(seconds: 15),
                                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                                    scrollDirection: Axis.horizontal,
                                    enlargeCenterPage: true,
                                    aspectRatio: 16 / 9,
                                    // viewportFraction: 1,
                                    onPageChanged: (index, reason) {}),
                                items: paketWedding.gallery.map((imgUrl) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, PreviewImagePage.KEY, arguments: RouteArgument<String>(passingData: imgUrl.image));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(3.w),
                                      child: ExtendedImage.network(
                                        imgUrl.image,
                                        fit: BoxFit.cover,
                                        borderRadius: BorderRadius.circular(3.w),
                                        shape: BoxShape.rectangle,
                                        alignment: FractionalOffset.center,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 100.sp),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: secondaryColor,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: CustomButton(
                  onTap: () async {
                    Navigator.pushNamed(context, KonfirmasiPesananScreen.KEY, arguments: RouteArgument<ModelPaketWedding>(passingData: paketWedding));
                  },
                  title: total.output.symbolOnRight,
                ),
              ),
            ],
          )
        ],
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
