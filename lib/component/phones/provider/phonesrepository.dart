import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/repository/DBserver/datafromsheet.dart';
import 'package:hive/hive.dart';

class PhonesRepository {
  // rendre la class signlton
  static final PhonesRepository _phonesProvider = PhonesRepository._internal();
  factory PhonesRepository() {
    return _phonesProvider;
  }
  PhonesRepository._internal();

  static Box<Phone> boxPhones = Hive.box<Phone>('phones');
  static Box<String> boxCycles = Hive.box<String>('cycles');
  static Box<List<String>> boxCommunescycle =
      Hive.box<List<String>>('communescycle');

  static List<List<String>> resultat = [];
  static List<Phone> _livephones = [];

  static savePhonesToBox() async {
    print("savePHonetobox");
    if (resultat.isEmpty) {
      print("resultat is emplty,i look in server");
      resultat = await DataFromSheet.getDataForSheet();
    }
    var rr3 = _listOfPhones(resultat, false);
    boxPhones.putAll(rr3[0]);
    boxCycles.addAll(rr3[1]);
    boxCommunescycle.addAll(rr3[2].values);
  }

  static Future<List<dynamic>> getPhones() async {
    var rr3 = [];
    if (boxPhones.values.isEmpty) {
      if (resultat.isEmpty) resultat = await DataFromSheet.getDataForSheet();
      rr3 = _listOfPhones(resultat, true);
      print("return phones live");
      _livephones = rr3[0];
      return [_livephones, rr3[1], rr3[2].values.toList()];
    } else {
      print("phones from box : ${boxPhones.values.length}");
      //await savePhonesToBox();
      return [
        boxPhones.values.toList(),
        boxCycles.values.toList(),
        boxCommunescycle.values.toList()
      ];
    }
  }

// prepare cycle et mapcommunebycycles

  static List<dynamic> _listOfPhones(List<List<String>> resultat, bool live) {
    Map<String, Phone> listphone = {};
    List<Phone> livelistphone = [];
    List<String> listcatcycle = resultat.map((e) => e[1]).toSet().toList();
    Map<String, List<String>> mapcatcommune = {};

    for (var cy in listcatcycle) {
      mapcatcommune[cy] = resultat
          .where((el) => el[1] == cy && el.isNotEmpty)
          .map((e) => e[2])
          .toSet()
          .toList();
    }

    for (var row in resultat) {
      if (live == false) listphone[row[0]] = Phone.createPhone(row);
      if (live == true) livelistphone.add(Phone.createPhone(row));
    }
    var p = live == false ? listphone : livelistphone;

    return [p, listcatcycle, mapcatcommune];
  }

  static List<Phone> get getPhonesFavoris {
    var x = boxPhones.isNotEmpty ? boxPhones.values : _livephones.toList();
    return x.where((e) => e.fav == true).toList();
  }

  static List<Phone> get getAllPhones {
    var x = boxPhones.isNotEmpty ? boxPhones.values : _livephones.toList();
    return x.toList();
  }

  static setFavoris(String ref, Phone ph) {
    if (boxPhones.isNotEmpty) {
      boxPhones.put(ref, ph);
    }
  }
}
