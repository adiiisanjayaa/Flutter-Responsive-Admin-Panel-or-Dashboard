import 'package:admin/models/model_pesanan.dart';
import 'package:admin/providers/main_provider.dart';
import 'package:admin/providers/pesanan_provider.dart';
import 'package:admin/screens/pesanan/detail_pesanan_screen.dart';
import 'package:admin/utility/route_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../utility/constants.dart';
import 'item_paket_wedding.dart';

class ListPesanan extends StatefulWidget {
  const ListPesanan({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPesanan> createState() => _ListPesananState();
}

class _ListPesananState extends State<ListPesanan> {
  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (context.read<MainProvider>().user != null) context.read<PesananProvider>().initPesanan(context.read<MainProvider>().user!.id.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryPrimaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pesanan Anda",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          // SizedBox(height: defaultPadding),
          // Chart(),
          Consumer<PesananProvider>(builder: (context, pesananProvider, _) {
            return pesananProvider.pesanan.isEmpty
                ? SizedBox.shrink()
                : ListView.builder(
                    itemCount: pesananProvider.pesanan.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, DetailPesananScreen.KEY, arguments: RouteArgument<ModelPesanan>(passingData: pesananProvider.pesanan[index]));
                        },
                        child: ItemPesanan(
                          pesanan: pesananProvider.pesanan[index],
                        ),
                      );
                    },
                  );
          }),
        ],
      ),
    );
  }
}
