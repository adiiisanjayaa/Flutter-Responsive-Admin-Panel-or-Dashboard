import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../utility/constants.dart';

class ItemPaketWedding extends StatelessWidget {
  const ItemPaketWedding({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.descriptions,
  }) : super(key: key);

  final String title, image, price, descriptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryPrimaryColor,
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: ExtendedImage.network(
              image,
              fit: BoxFit.cover,
              cache: true,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    descriptions,
                    style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white70),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Text(price)
        ],
      ),
    );
  }
}
