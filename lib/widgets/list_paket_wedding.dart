import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../utility/constants.dart';
import 'item_paket_wedding.dart';

class ListPaketWedding extends StatelessWidget {
  const ListPaketWedding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExtendedImage.network(
          "https://phinemo.com/wp-content/uploads/2020/05/43546614_332753363937314_8020525196903446510_n-min.jpg",
          fit: BoxFit.cover,
          cache: true,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        SizedBox(height: defaultPadding),
        Text(
          "Bali Wedding Paket",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(height: defaultPadding),
        Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: secondaryPrimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Paket Wedding",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // SizedBox(height: defaultPadding),
              // Chart(),
              ItemPaketWedding(
                image: "https://phinemo.com/wp-content/uploads/2020/05/43546614_332753363937314_8020525196903446510_n-min.jpg",
                title: "Paket 1",
                price: "Rp. 1.000.000",
                descriptions: "lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem",
              ),
              ItemPaketWedding(
                image: "https://phinemo.com/wp-content/uploads/2020/05/43546614_332753363937314_8020525196903446510_n-min.jpg",
                title: "Paket 2",
                price: "Rp. 2.000.000",
                descriptions: "lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem",
              ),
              ItemPaketWedding(
                image: "https://phinemo.com/wp-content/uploads/2020/05/43546614_332753363937314_8020525196903446510_n-min.jpg",
                title: "Paket 3",
                price: "Rp. 3.000.000",
                descriptions: "lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem",
              ),
              ItemPaketWedding(
                image: "https://phinemo.com/wp-content/uploads/2020/05/43546614_332753363937314_8020525196903446510_n-min.jpg",
                title: "Paket 4",
                price: "Rp. 4.000.000",
                descriptions: "lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem ip sumet lorem",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
