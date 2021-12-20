import 'package:bigsi_ms_safi/communicator/homepage.dart';
import 'package:bigsi_ms_safi/component/news/newsprovider.dart';
import 'package:bigsi_ms_safi/component/news/newsview.dart';
import 'package:bigsi_ms_safi/component/phones/provider/cycleprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/component/phones/view/phonespage.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PhoneAdapter());
  await Hive.openBox<Phone>('phones');
  await Hive.openBox<String>('cycles');
  await Hive.openBox<List<String>>('communescycle');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PhonesProvider()),
    ChangeNotifierProvider(create: (_) => CycleProvider()),
    ChangeNotifierProvider(create: (_) => NewsProvider()),
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
          textDirection: TextDirection.rtl, child: HomePage()),
      routes: {
        'phoneslist': (BuildContext context) => const PhonesPage(),
        'newsview': (BuildContext context) => const NewsView()
      },
    );
  }
}
