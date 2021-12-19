import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneCatCommune extends StatelessWidget {
  const PhoneCatCommune({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PhonesProvider>(builder: (context, cat, _) {
      return Visibility(
        // ignore: prefer_contains
        visible: cat.activelistcommunes.length > 1,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ToggleButtons(
              direction: Axis.vertical,
              selectedColor: Colors.black,
              disabledColor: Colors.blue,
              children: _creatcat(cat.activelistcommunes),
              isSelected: cat.activelistcommunesbool,
              onPressed: (int i) {
                cat.updatePhonesByCommune(i);
              },
            )),
      );
    });
  }

  List<Widget> _creatcat(List<String> ca) {
    print("je suis ici catCommune(vertical).length = ${ca.indexOf('')}");
    List<Widget> s = [];
    for (var i in ca) {
      s.add(Text(i));
    }
    return s;
  }
}
