import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesrepository.dart';
import 'package:flutter/widgets.dart';

class PageHomeProvider with ChangeNotifier {
  int get nbrPhones => PhonesRepository.boxPhones.length;
  int nbrFavoris = 0;
  int nbrNews = 0;
}
