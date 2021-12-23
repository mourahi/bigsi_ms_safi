import 'package:bigsi_ms_safi/component/groupsphone/groupsphone.dart';
import 'package:bigsi_ms_safi/component/groupsphone/groupsphonerepository.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesrepository.dart';
import 'package:flutter/widgets.dart';

class GroupsPhoneProvider with ChangeNotifier {
  // rendre la class signlton
  static final GroupsPhoneProvider _phonesProvider =
      GroupsPhoneProvider._internal();
  factory GroupsPhoneProvider() {
    return _phonesProvider;
  }
  GroupsPhoneProvider._internal();

  var groupsPhoneList = [];

  updateGroupsPhoneFromRepository() async {
    var ln = await GroupsPhoneRepository.getGroupsPhone();
    groupsPhoneList = ln;
    notifyListeners();
  }

  savePhonesToBox(GroupsPhone gh) async {
    PhonesRepository.savePhonesToBox(); // save phons to box
    GroupsPhoneRepository.saveChangeToGroupPhone(gh);
    notifyListeners();
  }

  updateListPhonesfromRepository() {
    PhonesProvider().updateListPhonesfromRepository();
  }
}
