import 'package:flutter/widgets.dart';

class CycleProvider with ChangeNotifier {
  static final CycleProvider _instance = CycleProvider._interne();
  List<String> listcatcycles = [];
  List<bool> listcatcyclesbool = [];
  List<String> listactivedcycle = [];

  factory CycleProvider() {
    return _instance;
  }

  CycleProvider._interne();

  updateCycle(List<String> cy) {
    // first update from internet ou box
    listcatcycles = cy;
    listcatcyclesbool = List.generate(cy.length, (index) => false);
    notifyListeners();
  }

  notifierCommune() {
    notifyListeners();
  }
}
