import 'package:bigsi_ms_safi/communicator/pagehomeprovider.dart';
import 'package:bigsi_ms_safi/component/formation/formationcomponent.dart';
import 'package:bigsi_ms_safi/component/news/news.dart';
import 'package:bigsi_ms_safi/component/news/newscomponent.dart';
import 'package:bigsi_ms_safi/component/phones/view/phonescomponent.dart';
import 'package:bigsi_ms_safi/communicator/pagehome.dart';
import 'package:bigsi_ms_safi/component/news/newsprovider.dart';
import 'package:bigsi_ms_safi/component/news/newsview.dart';
import 'package:bigsi_ms_safi/component/phones/provider/cycleprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PhoneAdapter());
  Hive.registerAdapter(NewsAdapter());
  await Hive.openBox<Phone>('phones');
  await Hive.openBox<String>('cycles');
  await Hive.openBox<List<String>>('communescycle');
  await Hive.openBox<News>('news');
  await Hive.openBox<String>('catnews');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PhonesProvider()),
    ChangeNotifierProvider(create: (context) => CycleProvider()),
    ChangeNotifierProvider(create: (context) => NewsProvider()),
    ChangeNotifierProvider(create: (context) => PageHomeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BigSi-MS-Safi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: PageHome()),
      routes: {
        'phonescomponent': (BuildContext context) => const PhonesComponent(),
        'newscomponent': (BuildContext context) => const NewsComponent(),
        'formationcomponent': (BuildContext context) =>
            const FormationComponent(),
        'newsview': (BuildContext context) => const NewsView(),
        'pagechoice': (BuildContext context) => const PageHome()
      },
    );
  }
}
