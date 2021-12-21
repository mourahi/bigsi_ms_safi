import 'package:bigsi_ms_safi/component/news/news.dart';
import 'package:bigsi_ms_safi/repository/DBserver/datafromsheet.dart';
import 'package:hive/hive.dart';

class NewsRepository {
  static Box<News> boxNews = Hive.box<News>('news');
  static Box<String> boxCatNews = Hive.box<String>('catnews');

  static Future<List<dynamic>> getNews() async {
    // dois faire le choix entre local et server
    if (boxNews.isEmpty) {
      print("BoxNEWS vide, je cherche internet et sauvegarde");
      var d = await DataFromSheet.getDataForSheet(namesheet: 'news');
      var rr2 = _listOfNews(d);
      boxNews.putAll(rr2[0]);
      print("rr2[1] =${rr2[1]}");
      boxCatNews.addAll(rr2[1]);
    }
    return [
      boxNews.values.toList(),
      boxCatNews.values.toList()
    ]; // list [listphones, listcatycle, listmapcommune]
  }

  static List<dynamic> _listOfNews(List<List<String>> resultat) {
    Map<String, News> listnews = {};
    List<String> listcattitre = resultat.map((e) => e[7]).toSet().toList();

    for (var row in resultat) {
      listnews[row[0].toString()] = News.createNews(row);
    }
    return [listnews, listcattitre];
  }
}
