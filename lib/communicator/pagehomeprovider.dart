import 'package:bigsi_ms_safi/component/groupsphone/groupsphoneprovider.dart';
import 'package:bigsi_ms_safi/component/groupsphone/groupsphonerepository.dart';
import 'package:bigsi_ms_safi/component/news/newsrepository.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesrepository.dart';
import 'package:flutter/widgets.dart';

class PageHomeProvider with ChangeNotifier {
  int nbrPhones = 0;
  int nbrNews = 0;
  int nbrgroups = 0;

  prepareData() async {
    // _clearBox();
    /*   var a = await PhonesRepository.getPhones();
    nbrPhones = a[0].length; */

/*     var c = await GroupsPhoneRepository.getGroupsPhone();
    nbrgroups = c.length; */

/*     var b = await NewsRepository.getNews();
    nbrNews = b[0].length; */

    // notifyListeners();
    print("ph =$nbrPhones  groups=$nbrgroups  news=$nbrNews");
  }

  void clearBox() {
    PhonesRepository.boxPhones.clear();
    PhonesRepository.boxCommunescycle.clear();
    PhonesRepository.boxCycles.clear();
    NewsRepository.boxCatNews.clear();
    NewsRepository.boxNews.clear();
    GroupsPhoneRepository.boxGroupsPhone.clear();
  }

  updateGroupsPhoneFromRepository() {
    GroupsPhoneProvider().updateGroupsPhoneFromRepository();
  }
}
