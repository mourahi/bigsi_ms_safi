import 'package:bigsi_ms_safi/component/groupsphone/groupsphonerepository.dart';
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
    if (ln.isNotEmpty) {
      groupsPhoneList = ln;
      notifyListeners();
    }
  }

  savePhonesToBox() async {
    PhonesRepository.savePhonesToBox();
    notifyListeners();
  }
}
