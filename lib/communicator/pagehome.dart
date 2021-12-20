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
                Navigator.of(context).pushNamed('homepage');
              },
              child: const Card(
                child: Text("un"),
                color: Colors.green,
              ),
            ),
            const Card(
              child: Text("un"),
              color: Colors.red,
            ),
            const Card(
              child: Text("un"),
              color: Colors.yellow,
            ),
            const Card(
              child: Text("un"),
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
