import 'package:counter_7/model/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchList>> fetchWatchList() async {
  var url =
      Uri.parse('https://tugas3arinaaunaka.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyWatchList> listWatch = [];
  for (var d in data) {
    if (d != null) {
      listWatch.add(MyWatchList.fromJson(d));
    }
  }
  return listWatch;
}
