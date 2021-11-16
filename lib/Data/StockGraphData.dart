class StockGraphData{
  late DateTime? dateTime;
  late double? price;
  StockGraphData(int timestamp,double cost)
  {
    dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    price = cost;
  }
}