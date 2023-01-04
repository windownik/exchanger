import 'dart:convert';

import 'package:http/http.dart' as http;

List<String> symbols = ["BTCUSDT",];
String url = 'https://api.binance.com/api/v3/ticker/price';

Future<void> getCryptoCurs () async {
  String urlAddress = 'api.binance.com';
  var timeNow = DateTime.now();
  var lustMonth = timeNow.subtract(const Duration(days: 30));
  Map<String, String> params = {"symbols": '["BTCUSDT"]'};
  var url = Uri.https(urlAddress, "/api/v3/ticker/price", params);
  var res = await http.get(url);
  List<dynamic> resSales = jsonDecode(res.body);
  int i = 0;
  for (var resp in resSales) {
    i += 1;
  }
}

Future<void> getMosCurs () async {
  String urlAddress = 'api.binance.com';
  var timeNow = DateTime.now();
  var lustMonth = timeNow.subtract(const Duration(days: 30));
  Map<String, String> params = {"symbols": '["BTCUSDT"]'};
  var url = Uri.https(urlAddress, "/api/v3/ticker/price", params);
  var res = await http.get(url);
  List<dynamic> resSales = jsonDecode(res.body);
  int i = 0;
  for (var resp in resSales) {
    i += 1;
  }
}