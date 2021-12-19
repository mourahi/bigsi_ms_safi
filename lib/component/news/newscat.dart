import 'package:bigsi_ms_safi/component/news/newsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsCat extends StatelessWidget {
  const NewsCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<NewsProvider>(builder: (context, cat, _) {
        return ToggleButtons(
          selectedColor: Colors.black,
          disabledColor: Colors.blue,
          children: _widgetcats(cat.listCatNews),
          isSelected: cat.listCatNewsBool,
          onPressed: (int i) {
            cat.filterByindexOfCatews(i);
          },
        );
      }),
    );
  }

  List<Widget> _widgetcats(List<String> cats) {
    List<Widget> r = [];
    for (var ca in cats) {
      r.add(Text(ca));
    }
    return r;
  }
}
