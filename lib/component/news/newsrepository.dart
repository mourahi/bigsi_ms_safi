import 'package:bigsi_ms_safi/component/news/news.dart';
import 'package:bigsi_ms_safi/repository/DBserver/datafromsheet.dart';

class NewsRepository {
  static Future<List<dynamic>> getNews() async {
    // dois faire le choix entre local et server
    var d = await DataFromSheet.getDataForSheet(namesheet: 'news');
    return News.listOfNews(d); // list [listphones, listcatycle, listmapcommune]
  }
}
