import 'package:bigsi_ms_safi/component/groupsphone/groupsphone.dart';
import 'package:bigsi_ms_safi/repository/DBserver/datafromsheet.dart';
import 'package:hive/hive.dart';

class GroupsPhoneRepository {
  static Box<GroupsPhone> boxGroupsPhone = Hive.box<GroupsPhone>('groupsphone');

  static Future<List<dynamic>> getGroupsPhone() async {
    // dois faire le choix entre local et server

    //boxGroupsPhone.clear(); // provisoire

    if (boxGroupsPhone.isEmpty) {
      print("boxGroupsPhone vide, je cherche internet et sauvegarde");
      var d = await DataFromSheet.getDataForSheet(namesheet: 'groupsphone');
      print("d=$d");
      var rr2 = _listOfGroupsPhone(d);
      print("rr2= $rr2");
      boxGroupsPhone.putAll(rr2);
    }
    return boxGroupsPhone.values.toList();
  }

  static Map<String, GroupsPhone> _listOfGroupsPhone(
      List<List<String>> resultat) {
    Map<String, GroupsPhone> listgroupsphone = {};
    for (var row in resultat) {
      listgroupsphone[row[0].toString()] = GroupsPhone.createPhone(row);
    }
    return listgroupsphone;
  }
}
