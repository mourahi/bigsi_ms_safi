class News {
  String ordre, titre, contenu, image, datepub, lien, type, categorie;
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

  factory News._createNews(List<String> res) {
    return News(res[0], res[1], res[2], res[3], res[4], res[5], res[6], res[7]);
  }

  static List<dynamic> listOfNews(List<List<String>> resultat) {
    List<News> listnews = [];
    listcattitre = resultat.map((e) => e[7]).toSet().toList();

    for (var row in resultat) {
      listnews.add(News._createNews(row));
    }
    return [listnews, listcattitre];
  }
}
