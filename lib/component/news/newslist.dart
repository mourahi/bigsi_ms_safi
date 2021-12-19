import 'package:bigsi_ms_safi/component/news/news.dart';
import 'package:bigsi_ms_safi/component/news/newscat.dart';
import 'package:bigsi_ms_safi/component/news/newsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Visibility(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: NewsCat())),
        Consumer<NewsProvider>(builder: (context, value, _) {
          return Expanded(
            child: ListView.builder(
                itemCount: value.listNews.length,
                itemBuilder: (BuildContext ctx, int i) {
                  return Container(
                    color: Colors.red,
                    margin: const EdgeInsets.all(8.0),
                    child: _newsItem(ctx, i, value.listNews[i]),
                  );
                }),
          );
        }),
      ],
    );
  }

  Widget _newsItem(BuildContext context, int i, News ns) {
    return Card(
        child: ListTile(
      title: Text("${ns.titre} $i"),
      leading: const Icon(Icons.ac_unit),
      onTap: () {
        Navigator.of(context).pushNamed('newsview', arguments: ns);
      },
    ));
  }
}
