import 'package:bigsi_ms_safi/communicator/mydrawer.dart';
import 'package:bigsi_ms_safi/component/news/newsprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:bigsi_ms_safi/component/phones/view/phonespage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class PhonesComponent extends StatelessWidget {
  const PhonesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Hive.box<Phone>('phones').clear();
                    Hive.box<String>('cycles').clear();
                    Hive.box<List<String>>('communescycle').clear();
                  },
                  icon: const Icon(Icons.delete))
            ],
            title: const Center(child: Text('BigSi-MS-Safi')),
            leading: IconButton(
                onPressed: () {
                  /* showSearch(
                      context: context,
                      delegate: PhonesSearchBar(),
                      useRootNavigator: true);*/
                  Provider.of<PhonesProvider>(context, listen: false)
                      .updateListPhonesfromRepository();
                  Provider.of<NewsProvider>(context, listen: false)
                      .updateNewsFromRepository();
                },
                icon: const Icon(Icons.search)),
          ),
          endDrawer: const MyDrawer(),
          body: const PhonesPage()),
    );
  }
}
