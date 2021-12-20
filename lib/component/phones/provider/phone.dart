import 'package:hive/hive.dart';
part 'phone.g.dart';

@HiveType(typeId: 0)
class Phone extends HiveObject {
  @HiveField(0)
  final String ref;
  @HiveField(1)
  final String cycle;
  @HiveField(2)
  final String commune;
  @HiveField(3)
  final String gresa;
  @HiveField(4)
  final String ecole;
  @HiveField(5)
  final String nom;
  @HiveField(6)
  final String tel;
  @HiveField(7)
  final String fonction;
  @HiveField(8)
  final String email;
  @HiveField(9)
  final String geo;
  @HiveField(10)
  bool fav;
  @HiveField(11)
  int indexhive;

  static List<String> listcatcycle = [];
  static Map<String, List<String>> mapcatcommune = {};

  Phone(this.ref, this.cycle, this.commune, this.gresa, this.ecole, this.nom,
      this.tel, this.fonction, this.email, this.geo,
      [this.fav = false, this.indexhive = -1]);
  Phone.vide()
      : ref = '',
        cycle = '',
        commune = '',
        gresa = '',
        ecole = '',
        nom = '',
        tel = '',
        fonction = '',
        email = '',
        geo = '',
        fav = false,
        indexhive = -1;

  factory Phone.createPhone(List<String> res) {
    return Phone(
        res[0],
        res[1],
        res[2],
        res[3],
        res[4],
        res[5],
        res[6],
        res[7],
        res[8],
        res[9],
        false,
        -1); //deux autres sont facultative fav=false et indexhive=-1
  }
}
