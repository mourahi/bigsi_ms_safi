// ignore_for_file: avoid_print

import 'package:bigsi_ms_safi/component/groupsphone/groupsphone.dart';
import 'package:bigsi_ms_safi/repository/DBserver/datafromsheet.dart';
import 'package:hive/hive.dart';

class GroupsPhoneRepository {
  static Box<GroupsPhone> boxGroupsPhone = Hive.box<GroupsPhone>('groupsphone');

  static Future<List<dynamic>> getGroupsPhone() async {
    print("getGroupPHones");
    if (boxGroupsPhone.isEmpty) {
      print("boxGroupsPhone.isEmpty, je cherche internet et sauvegarde");
      var d = await DataFromSheet.getDataForSheet(namesheet: 'groupsphone');
      var rr2 = _listOfGroupsPhone(d);
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

  static saveChangeToGroupPhone(GroupsPhone gh) {
    print("saveChangeToGroupPhone icon save hhh, penser à supprimer aussi");
    if (boxGroupsPhone.isNotEmpty) boxGroupsPhone.put(gh.numero, gh);
  }
}
