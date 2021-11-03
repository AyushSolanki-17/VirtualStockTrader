import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;
dynamic getStockData(String StockCode) async {
  Response response = await http.get(Uri.parse(
      "https://query1.finance.yahoo.com/v8/finance/chart/${StockCode}?region=IND&lang=en-US&includePrePost=false&interval=1h&useYfid=true&range=1d"));
  var r = convert.json.decode(response.body);
  return r;
}