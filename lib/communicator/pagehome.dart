// ignore_for_file: avoid_print

import 'package:bigsi_ms_safi/communicator/pagehomeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);
  static int n = 0;
  @override
  Widget build(BuildContext context) {
    print("PageHome n= ${n++}");
    var ok = false;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Consumer<PageHomeProvider>(builder: (context, data, _) {
          if (ok == false) {
            print("prepare data from pagehome");
            data.prepareData();
            ok = true;
          }
          return GridView.count(
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () {
                  data.updateGroupsPhoneFromRepository();
                  Navigator.of(context).pushNamed('groupsphonecomponent');
                },
                child: Card(
                  child: Center(
                      child: Text(
                    "الهاتف (${data.nbrPhones})",
                    style: const TextStyle(fontSize: 25),
                  )),
                  color: Colors.green,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('newscomponent');
                },
                child: Card(
                  child: Center(
                      child: Text(
                    "المستجدات (${data.nbrNews})",
                    style: const TextStyle(fontSize: 25),
                  )),
                  color: Colors.red,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("formationcomponent");
                },
                child: const Card(
                  child: Center(
                      child: Text(
                    "التكوينات",
                    style: TextStyle(fontSize: 25),
                  )),
                  color: Colors.yellow,
                ),
              ),
              GestureDetector(
                onTap: () {
                  data.clearBox();
                },
                child: const Card(
                  child: Center(
                      child: Text(
                    "Effacer BOX",
                    style: TextStyle(fontSize: 25),
                  )),
                  color: Colors.orange,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
