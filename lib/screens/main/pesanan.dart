import 'package:admin/responsive.dart';
import 'package:admin/widgets/header.dart';
import 'package:admin/widgets/list_pesanan.dart';
import 'package:flutter/material.dart';

import '../../utility/constants.dart';

class PesananScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      //Mobile version
                      if (Responsive.isMobile(context)) ListPesanan(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: ListPesanan(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
