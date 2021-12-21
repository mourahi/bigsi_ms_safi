import 'package:bigsi_ms_safi/component/news/news.dart';
import 'package:bigsi_ms_safi/component/news/newsrepository.dart';
import 'package:flutter/widgets.dart';

class NewsProvider with ChangeNotifier {
  // rendre la class signlton
  static final NewsProvider _phonesProvider = NewsProvider._internal();
  factory NewsProvider() {
    return _phonesProvider;
  }
  NewsProvider._internal();

  List<News> listNews = [];
  List<News> _listNews = [];
  List<String> listCatNews = [];
  List<bool> listCatNewsBool = [];

  updateNewsFromRepository() async {
    var ln = await NewsRepository.getNews();
    if (ln.isNotEmpty) {
      listNews = ln[0];
      _listNews = listNews.toList();
      listCatNews = ln[1];
      listCatNewsBool = List.generate(listCatNews.length, (_) => false);
      notifyListeners();
    }
  }

  filterByindexOfCatews([int index = -1]) {
    if (listCatNewsBool[index] == true) {
      listCatNewsBool[index] = false;
      listNews = _listNews.toList();
    } else {
      listCatNewsBool = List.generate(listCatNews.length, (index) => false);
      listCatNewsBool[index] = true;
      listNews = _listNews
          .where((element) => element.categorie == listCatNews[index])
          .toList();
    }

    notifyListeners();
  }
}
