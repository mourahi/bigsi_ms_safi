import 'package:bigsi_ms_safi/communicator/pagehomeprovider.dart';
import 'package:bigsi_ms_safi/component/groupsphone/groupsphoneprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var ok = false;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Consumer<PageHomeProvider>(builder: (context, data, _) {
          print("je lance la recherche data");
          if (ok == false) {
            data.prepareData();
            ok = true;
          }
          return GridView.count(
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('groupsphonecomponent');
                  GroupsPhoneProvider().updateGroupsPhoneFromRepository();
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
