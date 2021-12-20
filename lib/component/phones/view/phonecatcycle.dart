import 'package:bigsi_ms_safi/component/phones/provider/cycleprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneCatCycle extends StatelessWidget {
  const PhoneCatCycle({Key? key}) : super(key: key);
  static int n = 0;
  @override
  Widget build(BuildContext context) {
    print("cycle horizontal appel n:${n++}");
    return Visibility(
      visible: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<CycleProvider>(
          builder: (context, cat, _) {
            // cat horizontal
            return ToggleButtons(
              selectedColor: Colors.black,
              disabledColor: Colors.blue,
              children: _creatcat(cat.listcatcycles),
              isSelected: cat.listcatcyclesbool,
              onPressed: (int i) {
                context.read<PhonesProvider>().updatecommunesbycycle(i);
                cat.notifierCommune();
              },
            );
          },
        ),
      ),
    );
  }

  List<Widget> _creatcat(List<String> cat) {
    List<Widget> s = [];
    for (var i in cat) {
      s.add(Text(i));
    }
    return s;
  }
}
