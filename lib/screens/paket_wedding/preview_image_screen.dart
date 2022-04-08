import 'package:admin/utility/route_argument.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class PreviewImagePage extends StatefulWidget {
  static const KEY = "/PreviewProductPage";
  const PreviewImagePage({Key? key, required this.image}) : super(key: key);

  final RouteArgument<String> image;

  @override
  State<PreviewImagePage> createState() => _PreviewImagePageState();
}

class _PreviewImagePageState extends State<PreviewImagePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var dataImage = widget.image.passingData;

    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: getProportionateScreenWidth(0),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Preview"),
      ),
      body: ExtendedImage.network(
        dataImage,
        fit: BoxFit.contain,
        mode: ExtendedImageMode.gesture,
        initGestureConfigHandler: (ExtendedImageState state) {
          return GestureConfig(
            inPageView: true,
            initialScale: 1.0,
            maxScale: 5.0,
            animationMaxScale: 6.0,
            initialAlignment: InitialAlignment.center,
          );
        },
      ),
    );
  }
}
