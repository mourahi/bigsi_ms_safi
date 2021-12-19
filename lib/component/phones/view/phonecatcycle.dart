import 'package:bigsi_ms_safi/component/phones/provider/cycleprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneCatCycle extends StatelessWidget {
  const PhoneCatCycle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<CycleProvider>(
          builder: (context, cat, child) {
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
    print("je suis ici catCycle(Horizontal).length = ${cat.length} , cat=$cat");
    List<Widget> s = [];
    for (var i in cat) {
      s.add(Text(i));
    }
    return s;
  }
}
