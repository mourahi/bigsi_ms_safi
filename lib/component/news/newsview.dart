import 'package:bigsi_ms_safi/component/news/news.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var x = ModalRoute.of(context);
    var ns = (x == null ? News.vide() : x.settings.arguments) as News;
    return Center(
      child: Scaffold(
        appBar: AppBar(),
        body: Text(
          ns.titre,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
