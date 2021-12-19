import 'package:bigsi_ms_safi/component/news/newslist.dart';
import 'package:bigsi_ms_safi/component/phones/view/phonecatcommune.dart';
import 'package:bigsi_ms_safi/component/phones/view/phonecatcycle.dart';
import 'package:bigsi_ms_safi/component/phones/view/phonelistfavoris.dart';
import 'package:bigsi_ms_safi/component/phones/view/phoneslist.dart';
import 'package:flutter/material.dart';

class PhonesPage extends StatelessWidget {
  const PhonesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.phone)),
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.airplay)),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                const PhoneCatCycle(), // categorie cycle
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                      PhoneCatCommune(),
                      PhonesList(),
                    ])),
              ],
            ),
            const PhonesListFavoris(),
            const NewsList(),
          ],
        ),
      ),
    );
  }
}
