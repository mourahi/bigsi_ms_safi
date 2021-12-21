import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/repository/DBserver/datafromsheet.dart';
import 'package:hive/hive.dart';

class PhonesRepository {
  static Box<Phone> boxPhones = Hive.box<Phone>('phones');
  static Box<String> boxCycles = Hive.box<String>('cycles');
  static Box<List<String>> boxCommunescycle =
      Hive.box<List<String>>('communescycle');

/*   static clearAllBox() {
    Hive.box<Phone>('phones').clear();
    Hive.box<String>('cycles').clear();
    Hive.box<List<String>>('communescycle').clear();
  } */

  static Future<List<dynamic>> getPhones() async {
    // dois faire le choix entre local et server
    if (boxPhones.isEmpty) {
      print("boxphones est vide , je cherche dans internet puis remplir boxes");
      var resulat = await DataFromSheet.getDataForSheet();
      var rr3 = _listOfPhones(resulat);
      boxPhones.putAll(rr3[0]);
      boxCycles.addAll(rr3[1]);
      boxCommunescycle.addAll(rr3[2].values);
    } else {
      print("Box est deja remplis, je vais profiter hhh");
    }

    return [
      boxPhones.values.toList(),
      boxCycles.values.toList(),
      boxCommunescycle.values.toList()
    ];
  }

// prepare cycle et mapcommunebycycles

  static List<dynamic> _listOfPhones(List<List<String>> resultat) {
    Map<String, Phone> listphone = {};
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
      listphone[row[0]] = Phone.createPhone(row);
    }
    return [listphone, listcatcycle, mapcatcommune];
  }

  static List<Phone> get getPhonesFavoris {
    return boxPhones.values.where((e) => e.fav == true).toList();
  }

  static List<Phone> get getAllPhones {
    return boxPhones.values.toList();
  }

  static setFavoris(String ref, Phone ph) {
    boxPhones.put(ref, ph);
  }
}
