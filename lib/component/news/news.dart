import 'package:hive/hive.dart';
part 'news.g.dart';

@HiveType(typeId: 2)
class News extends HiveObject {
  @HiveField(0)
  final String ordre;
  @HiveField(1)
  final String titre;
  @HiveField(2)
  final String contenu;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String datepub;
  @HiveField(5)
  final String lien;
  @HiveField(6)
  final String type;
  @HiveField(7)
  final String categorie;

  static List<String> listcattitre = [];

  News(this.ordre, this.titre, this.contenu, this.image, this.datepub,
      this.lien, this.type, this.categorie);
  News.vide()
      : ordre = '',
        titre = '',
        contenu = '',
        image = '',
        datepub = '',
        lien = '',
        type = '',
        categorie = '';

  factory News.createNews(List<String> res) {
    return News(res[0], res[1], res[2], res[3], res[4], res[5], res[6], res[7]);
  }
}
