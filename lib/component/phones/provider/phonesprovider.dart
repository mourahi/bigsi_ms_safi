import 'package:bigsi_ms_safi/communicator/pagehomeprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/cycleprovider.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesrepository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PhonesProvider with ChangeNotifier {
  // rendre la class signlton
  static final PhonesProvider _phonesProvider = PhonesProvider._internal();
  factory PhonesProvider() {
    return _phonesProvider;
  }
  PhonesProvider._internal();

  List<Phone> listPhonesFavoris = []; // doit etre lier au box du hive

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
      listphones = res[0]; // doit etre rempler par box
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
    listPhonesFavoris = PhonesRepository.getPhonesFavoris;
    notifyListeners();
  }

  setfavoris(Phone ph) {
    PhonesRepository.boxPhones.put(ph.ref, ph);
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
    var _p = PhonesRepository.getAllPhones;
    return activedcycle.isEmpty
        ? _p
        : _p.where((ph) => activedcycle.contains(ph.cycle)).toList();
  }

  _findPhonesByActiveCommunes() {
    List<Phone> f = _findPhonesByActiveCycles();

    return activedcommune.isEmpty
        ? f
        : f.where((ph) => activedcommune.contains(ph.commune)).toList();
  }
}
