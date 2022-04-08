import 'package:admin/models/model_paket_wedding.dart';
import 'package:admin/models/model_pesanan.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/constants.dart';

class ItemPaketWedding extends StatelessWidget {
  const ItemPaketWedding({
    Key? key,
    required this.paketWedding,
  }) : super(key: key);

  final ModelPaketWedding paketWedding;

  @override
  Widget build(BuildContext context) {
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
              paketWedding.image ?? "",
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 3.sp),
                    decoration: BoxDecoration(
                      color: green.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(2.sp),
                    ),
                    child: Text(total.output.symbolOnRight),
                  ),
                  Text(
                    paketWedding.namaPaket,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    paketWedding.keterangan,
                    style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white70),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemPesanan extends StatelessWidget {
  const ItemPesanan({
    Key? key,
    required this.pesanan,
  }) : super(key: key);

  final ModelPesanan pesanan;

  @override
  Widget build(BuildContext context) {
    MoneyFormatter total = new MoneyFormatter(
      amount: pesanan.paketWedding.totalHarga.toDouble(),
      settings: MoneyFormatterSettings(
        symbol: 'IDR',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 3,
        compactFormatType: CompactFormatType.short,
      ),
    );
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
              pesanan.paketWedding.image ?? "",
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 3.sp),
                    decoration: BoxDecoration(
                      color: green.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(2.sp),
                    ),
                    child: Text(total.output.symbolOnRight),
                  ),
                  Text(
                    pesanan.paketWedding.namaPaket,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    pesanan.paketWedding.keterangan,
                    style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white70),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
