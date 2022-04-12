import 'package:admin/models/model_pesanan.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/paket_wedding/preview_image_screen.dart';
import 'package:admin/utility/constants.dart';
import 'package:admin/utility/helpers.dart';
import 'package:admin/utility/route_argument.dart';
import 'package:admin/widgets/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPesananScreen extends StatefulWidget {
  static const KEY = "/DetailPesananScreen";

  const DetailPesananScreen({Key? key, required this.pesanan}) : super(key: key);

  final RouteArgument<ModelPesanan> pesanan;

  @override
  _DetailPesananScreenState createState() => _DetailPesananScreenState();
}

class _DetailPesananScreenState extends State<DetailPesananScreen> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // var weddingProvider = Provider.of<WeddingPaketProvider>(context, listen: false);
    var paketWedding = widget.pesanan.passingData.paketWedding;
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
                        Stack(
                          alignment: Alignment.bottomRight,
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
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 3.sp),
                              margin: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              child: Text(
                                widget.pesanan.passingData.status.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.w),
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
                                      total.output.symbolOnRight,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    Helpers.dateFormater(widget.pesanan.passingData.createdAt),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.sp),
                              widget.pesanan.passingData.notes != ""
                                  ? Container(
                                      padding: EdgeInsets.all(3.w),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2.w),
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                      child: Text(
                                        widget.pesanan.passingData.notes,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink(),
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
                    const _url = 'https://wa.me/6285156073413';
                    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
                  },
                  title: "Contact Us",
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
