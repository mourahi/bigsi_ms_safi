import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:bigsi_ms_safi/component/phones/view/phoneitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhonesList extends StatelessWidget {
  const PhonesList({Key? key}) : super(key: key);
  static int n = 0;
  @override
  Widget build(BuildContext context) {
    print("PhonesList appel n:${n++}");
    return Consumer<PhonesProvider>(
      builder: (context, value, _) {
        return Expanded(
          child: Column(
            children: [
              SizedBox(
                  height: value.listphones.isNotEmpty ? 0 : 40,
                  child: Container()), // a remplacer par Chargement...
              Expanded(
                child: ListView.builder(
                    itemCount: value.listphones.length,
                    itemBuilder: (BuildContext ctx, int ii) {
                      return PhoneItem(i: ii, phone: value.listphones[ii]);
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
