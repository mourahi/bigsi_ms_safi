import 'package:bigsi_ms_safi/component/phones/provider/cycleprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesrepository.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class PhonesProvider with ChangeNotifier {
  List<Phone> _listphonesBox = [];
  List<Phone> listPhonesFavoris = [];
  List<String> listRefFavorisBox = []; // doit etre lier au box du hiver

  List<Phone> listphones = [];
  List<List<String>> mapcyclecommunes = [];

  List<String> activedcycle = [];
  List<String> activedcommune = [];

  List<String> activelistcommunes = [];
  List<bool> activelistcommunesbool = [];

  updateListPhonesfromRepository() async {
    var res = await PhonesRepository.getPhones();
    print("appel PhoneRepository");
    if (res.isNotEmpty) {
      listphones =
          res[0]; // la valeur vient du box (je dois utliser box directement)
      _listphonesBox = listphones.toList(); // doit etre rempler par box
      mapcyclecommunes = res[2];

      CycleProvider().updateCycle(res[1]);
      activedcycle = []; // a remplacer par celui du cycleprovider
      activedcommune = [];
      activelistcommunes = [];
      activelistcommunesbool = [];
      getlistofPhonesfavoris();
    }

    notifyListeners();
  }

  getlistofPhonesfavoris() {
    // update du listview favoris
    listPhonesFavoris = _listphonesBox
        .where((el) => listRefFavorisBox.contains(el.ref))
        .toList();
    notifyListeners();
  }

  setfavoris(String ref) {
    listRefFavorisBox.contains(ref)
        ? listRefFavorisBox.remove(ref)
        : listRefFavorisBox.add(ref);
// Todos ("je dois sauvegarder dans box(phones) ")

    getlistofPhonesfavoris();
  }

  updatecommunesbycycle(int indexCycle) {
    var b = CycleProvider().listcatcyclesbool;
    var c = CycleProvider().listcatcycles;
    List<String> a = mapcyclecommunes[indexCycle];

    if (b[indexCycle] == false) {
      // déja false et il veux activé cycle
      b[indexCycle] = true; // active item du cycle
      activedcycle.add(c[indexCycle]);
      activelistcommunes.addAll(a);
    } else {
      b[indexCycle] = false;
      activedcycle.remove(c[indexCycle]);
    }

    activelistcommunes.clear();
    for (var x in activedcycle) {
      var nn = mapcyclecommunes[CycleProvider().listcatcycles.indexOf(x)];
      activelistcommunes.addAll(nn);
    }

    activelistcommunes =
        activelistcommunes.toSet().where((element) => element != '').toList();
    activelistcommunesbool =
        List.generate(activelistcommunes.length, (index) => false);

    listphones = _findPhonesByActiveCycles();
    notifyListeners();
  }

  updatePhonesByCommune(int indexcommune) {
    var b = activelistcommunesbool;
    var commune = activelistcommunes[indexcommune];

    if (activelistcommunesbool[indexcommune] == false) {
      // first click
      activedcommune.add(commune);
      b[indexcommune] = true;
    } else {
      activedcommune.remove(commune);
      b[indexcommune] = false;
    }

    listphones = _findPhonesByActiveCommunes();
    notifyListeners();
  }

  _findPhonesByActiveCycles() {
    return activedcycle.isEmpty
        ? _listphonesBox
        : _listphonesBox
            .where((ph) => activedcycle.contains(ph.cycle))
            .toList();
  }

  _findPhonesByActiveCommunes() {
    List<Phone> f = _findPhonesByActiveCycles();

    return activedcommune.isEmpty
        ? f
        : f.where((ph) => activedcommune.contains(ph.commune)).toList();
  }
}
