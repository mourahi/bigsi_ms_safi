import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/repository/DBserver/datafromsheet.dart';
import 'package:hive/hive.dart';

class PhonesRepository {
  static Box<Phone> boxPhones = Hive.box<Phone>('phones');
  static Box<String> boxCycles = Hive.box<String>('cycles');
  static Box<List<String>> boxCommunescycle =
      Hive.box<List<String>>('communescycle');

  static clearAllBox() {
    Hive.box<Phone>('phones').clear();
    Hive.box<String>('cycles').clear();
    Hive.box<List<String>>('communescycle').clear();
  }

  static Future<List<dynamic>> getPhones() async {
    // dois faire le choix entre local et server
    var rr3 = [];
    //clearAllBox();
    if (boxPhones.isEmpty) {
      print("boxphones est vide , je cherche dans internet puis remplir boxes");
      var resulat = await DataFromSheet.getDataForSheet();
      rr3 = listOfPhones(resulat);
      // remplir phonebox par ref comme key
      Map<String, Phone> phs = {};
      for (var ph in rr3[0]) {
        phs[ph.ref] = ph;
      }
      boxPhones.putAll(phs);
      boxCycles.addAll(rr3[1]);
      boxCommunescycle.addAll(rr3[2].values);
    }
    rr3 = [
      boxPhones.values.toList(),
      boxCycles.values.toList(),
      boxCommunescycle.values.toList()
    ];

    return rr3; // list [listphones, listcatycle, listmapcommune]
  }

// prepare cycle et mapcommunebycycles

  static List<dynamic> listOfPhones(List<List<String>> resultat) {
    List<Phone> listphone = [];
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
      listphone.add(Phone.createPhone(row));
    }
    return [listphone, listcatcycle, mapcatcommune];
  }

  static List<Phone> getPhonesFavoris() {
    return boxPhones.values.where((e) => e.fav == true).toList();
  }
}
