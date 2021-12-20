import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/repository/DBserver/datafromsheet.dart';
import 'package:hive/hive.dart';

class PhonesRepository {
  static Future<List<dynamic>> getPhones() async {
    // dois faire le choix entre local et server
    var rr3 = [];
    Box<Phone> boxPhones = Hive.box<Phone>('phones');
    Box<String> boxCycles = Hive.box<String>('cycles');
    Box<List<String>> boxCommunescycle =
        Hive.box<List<String>>('communescycle');

    if (boxPhones.isNotEmpty) {
      print("Box existe, je te passe les données");
      //print("boxCommunescycle ${boxCommunescycle.values}");
    } else {
      print("boxphones est vide , je cherche dans internet puis remplir boxes");
      var resulat = await DataFromSheet.getDataForSheet();
      rr3 = listOfPhones(resulat);
      boxPhones.addAll(rr3[0]);
      boxCycles.addAll(rr3[1]);
      boxCommunescycle.addAll(rr3[2].values);
      //boxCommunescycle.addAll(rr3[2]);
    }
    rr3 = [
      boxPhones.values.map((e) => e).toList(),
      boxCycles.values.map((e) => e).toList(),
      boxCommunescycle.values.map((e) => e).toList()
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
}
