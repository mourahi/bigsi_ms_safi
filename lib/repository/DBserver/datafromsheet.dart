import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DataFromSheet {
  static const _dp = {
    'safi': '1__YWeJR26tpyCep99NETXyMi9lXe1MA3JiJWr4y2-n0',
    'sraghna': '1oujKyUjSKUkxL6CBDqg9ihDkANLMCdjG4Dd0WEIAhAA'
  };

  static Future getDataForSheet({String namesheet = 'data'}) async {
    var url = Uri.https(
        'docs.google.com',
        '/spreadsheets/d/${_dp['safi']}/gviz/tq',
        {'tqx': 'out:json', 'sheet': namesheet});

    var resp = await http.get(url);
    print("status code:${resp.statusCode}");
    var vv = resp.body.toString();
    var ind = vv.indexOf('"rows":');
    var fin = vv.indexOf(',"parsedNumHeaders"');
    if (fin > 0) {
      vv = vv.substring(ind + 7, fin);
    } else {
      vv = vv.substring(ind + 7);
    }

    vv = vv.replaceAll('{"v":null}', '{"v":""}');

    var rr = convert.jsonDecode(vv);
    List<List<String>> resultat = [];

    for (var i = 1; i < rr.length; i++) {
      // i=1 we don't need columns title
      var cc = rr[i]['c'];
      List<String> temp = [];
      for (var j = 0; j < cc.length; j++) {
        temp.add(cc[j] == null ? "" : cc[j]['v'].toString());
      }
      if (!(temp.length == 1 && temp[0].isEmpty)) resultat.add(temp);
    }
    return resultat;
  }
}
