import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:bigsi_ms_safi/component/phones/view/phoneitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhonesListFavoris extends StatelessWidget {
  const PhonesListFavoris({Key? key}) : super(key: key);
  static int n = 0;
  @override
  Widget build(BuildContext context) {
    print("ListFavoris appel n:${n++}");
    return Consumer<PhonesProvider>(builder: (context, value, _) {
      return ListView.builder(
          itemCount: value.listPhonesFavoris.length,
          itemBuilder: (BuildContext ctx, int ii) {
            return PhoneItem(i: ii, phone: value.listPhonesFavoris[ii]);
          });
    });
  }
}
