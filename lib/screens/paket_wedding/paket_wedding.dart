import 'package:admin/responsive.dart';
import 'package:admin/widgets/header.dart';
import 'package:admin/widgets/list_paket_wedding.dart';
import 'package:admin/widgets/list_paket_wedding_web.dart';
import 'package:flutter/material.dart';

import '../../utility/constants.dart';

class PaketWeddingScreen extends StatefulWidget {
  @override
  State<PaketWeddingScreen> createState() => _PaketWeddingScreenState();
}

class _PaketWeddingScreenState extends State<PaketWeddingScreen> {
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
                if (Responsive.isMobile(context))
                  Expanded(
                    // flex: 5,
                    child: Column(
                      children: [
                        //Mobile version
                        ListPaketWedding(),
                      ],
                    ),
                  ),
                if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    // flex: 2,
                    child: ListPaketWeddingWeb(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
