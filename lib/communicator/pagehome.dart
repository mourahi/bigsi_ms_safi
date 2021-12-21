import 'package:bigsi_ms_safi/communicator/pagehomeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageHomeProvider nbrs = Provider.of<PageHomeProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('phonescomponent');
              },
              child: Card(
                child: Center(
                    child: Text(
                  "الهاتف (${nbrs.nbrPhones})",
                  style: const TextStyle(fontSize: 25),
                )),
                color: Colors.green,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('newscomponent');
              },
              child: const Card(
                child: Center(
                    child: Text(
                  "المستجدات",
                  style: TextStyle(fontSize: 25),
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
        ),
      ),
    );
  }
}
