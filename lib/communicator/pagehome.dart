import 'package:bigsi_ms_safi/communicator/pagehomeprovider.dart';
import 'package:bigsi_ms_safi/component/news/newsprovider.dart';
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
                  Navigator.of(context).pushNamed('phonescomponent');
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
                  Provider.of<NewsProvider>(context, listen: false)
                      .updateNewsFromRepository();
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
              const Card(
                child: Center(
                    child: Text(
                  "BigSI",
                  style: TextStyle(fontSize: 25),
                )),
                color: Colors.orange,
              ),
            ],
          );
        }),
      ),
    );
  }
}
