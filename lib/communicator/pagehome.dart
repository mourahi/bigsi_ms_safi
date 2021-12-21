import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: const Card(
                child: Center(
                    child: Text(
                  "الهاتف",
                  style: TextStyle(fontSize: 25),
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
