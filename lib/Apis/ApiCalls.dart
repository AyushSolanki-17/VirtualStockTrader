import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;


Future<List> getStocks(String code) async {
  Response response = await http.get(Uri.parse(
      "https://query1.finance.yahoo.com/v1/finance/lookup?formatted=true&lang=en-US&region=IND&query=${code}*&count=3000&start=0"));
  var r = convert.json.decode(response.body);
  return r["finance"]["result"][0]["documents"];
}

dynamic getStockData(String StockCode) async {
  Response response = await http.get(Uri.parse(
      "https://query1.finance.yahoo.com/v8/finance/chart/${StockCode}?region=IND&lang=en-US&includePrePost=false&interval=1h&useYfid=true&range=1d"));
  var r = convert.json.decode(response.body);
  return r;
}

dynamic getStockDataMonthly(String StockCode) async {
  Response response = await http.get(Uri.parse(
      "https://query1.finance.yahoo.com/v8/finance/chart/${StockCode}?region=IND&lang=en-US&includePrePost=false&interval=1d&useYfid=true&range=1mo"));
  var r = convert.json.decode(response.body);
  return r;
}

dynamic getStockTimeData(String StockCode,String interval,String range) async {
  Response response = await http.get(Uri.parse(
      "https://query1.finance.yahoo.com/v8/finance/chart/${StockCode}?region=IND&lang=en-US&includePrePost=false&interval=${interval}&useYfid=true&range=${range}"));
  var r = convert.json.decode(response.body);
  return r;
}

dynamic currencyConvertToINR(String currency) async{
  Response response = await http.get(Uri.parse(
      "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/${currency}/inr.json"));
  var r = convert.json.decode(response.body);
  return r;
}



