import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

List<String> symbols = ["BTCUSDT",];
String url = 'https://api.binance.com/api/v3/ticker/price';

Future<void> getCryptoCurs () async {
  String urlAddress = 'api.binance.com';
  Map<String, String> params = {"symbols": '["BTCUSDT"]'};
  var url = Uri.https(urlAddress, "/api/v3/ticker/price", params);
  var res = await http.get(url);
  print(res);
}

Future<String> getMosCurs () async {
  String urlAddress = 'cbr-xml-daily.ru';
  var url = Uri.https(urlAddress, "/daily_json.js");
  var res = await http.get(url);
  // Map<String, dynamic> resSales = jsonDecode((res.body).toString());
  return res.body;
}

Future<List<dynamic>> getAllCurrency () async {
  final String file = await rootBundle.loadString("assets/currency/currency.json");
  final data = await json.decode(file);
  return data;
}
