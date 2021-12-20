import 'package:bigsi_ms_safi/component/news/newslist.dart';
import 'package:flutter/material.dart';

class NewsComponent extends StatelessWidget {
  const NewsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(appBar: AppBar(), body: const NewsList()));
  }
}
