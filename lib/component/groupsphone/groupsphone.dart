import 'package:hive/hive.dart';
part 'groupsphone.g.dart';

@HiveType(typeId: 3)
class GroupsPhone extends HiveObject {
  @HiveField(0)
  final String numero;
  @HiveField(1)
  final String nom;
  @HiveField(2)
  final String lien;
  @HiveField(3)
  final String etat;
  @HiveField(4)
  String total;
  @HiveField(5)
  bool saved = false;

  GroupsPhone(this.numero, this.nom, this.lien, this.etat, this.total,
      [this.saved = false]);

  GroupsPhone.vide()
      : numero = '',
        nom = '',
        lien = '',
        etat = '',
        total = '',
        saved = false;

  factory GroupsPhone.createPhone(List<String> res) {
    return GroupsPhone(res[0], res[1], res[2], res[3], res[4], false);
  }
}
