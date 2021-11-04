import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virtualstocktrader/Apis/ApiCalls.dart';
import 'package:virtualstocktrader/AppThemes/AppThemes.dart';
import 'package:virtualstocktrader/Data/StockDetails.dart';
import 'package:virtualstocktrader/Data/StockGraphData.dart';


List<String> dropDownListTimeLineConverter(List<String> data)
{
  List<String> newData = [];
  for(var x in data)
    {
      if(x=="1d") newData.add("1 Day");
      else if(x=="5d") newData.add("5 Days");
      else if(x=="1mo") newData.add("1 Month");
      else if(x=="3mo") newData.add("3 Months");
      else if(x=="6mo") newData.add("6 Months");
      else if(x=="1y") newData.add("1 Year");
      else if(x=="2y") newData.add("2 Years");
      else if(x=="5y") newData.add("5 Years");
    }
  return newData;
}
getDataChartWidgets(String StockCode, String val, Color graphLineColor)
{
  if(val=="1 Day") return getDailyDataWidgets(StockCode,graphLineColor);
  else if(val=="5 Days") return get5DaysDataWidgets(StockCode,graphLineColor);
  else if(val=="1 Month") return getMonthlyDataWidgets(StockCode,graphLineColor);
  else if(val=="3 Months") return getQuarterlyDataWidgets(StockCode,graphLineColor);
  else if(val=="6 Months") return getHalfYearlyDataWidgets(StockCode,graphLineColor);
  else if(val=="1 Year") return getYearlyDataWidgets(StockCode,graphLineColor);
  else if(val=="2 Years") return get2YearsDataWidgets(StockCode,graphLineColor);
  else if(val=="5 Years") return get5YearsDataWidgets(StockCode,graphLineColor);
  else return Text('Loading');
}

getDailyDataWidgets(String StockCode,Color graphlineColor){


  return Container(
    child: FutureBuilder(
        future: getStockTimeData(StockCode, "1h", "1d"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            final StockDetails data2 =
            StockDetails.fromJson(snapshot.data);
            List<StockGraphData> stockGraphData = [];
            final List<int> timestamp =
            data2.chart!.result![0].timestamp!;
            final List<double> indicators =
            data2.chart!.result![0].indicators!.quote![0].close!;

            if (timestamp.length == indicators.length) {
              for (int x = 0; x < timestamp.length.toInt(); x++) {
                stockGraphData.add(new StockGraphData(timestamp[x],
                    double.parse(indicators[x].toStringAsFixed(2))));
                //print(stockGraphData[x].dateTime.day);
              }
            }
            stockGraphData.toSet().toList();
            if(stockGraphData.length > 0)
            {
              return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Daily Stock Analysis ${DateFormat('d/M').format(stockGraphData.first.dateTime)}'),
                  // Enable legend
                  //legend: Legend(isVisible: true),
                  // Enable tooltip
                  //tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<StockGraphData, String>>[
                    LineSeries<StockGraphData, String>(
                        dataSource: stockGraphData,
                        xValueMapper: (StockGraphData sales, _) => "${sales.dateTime.hour.toString()}",
                        yValueMapper: (StockGraphData sales, _) => sales.price,
                        name: 'Stock Price',
                        color: graphlineColor,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: false))
                  ]);
            }
          }
          return Text('Loading');
        }),
  );
}
get5DaysDataWidgets(String StockCode,Color graphlineColor){


  return Container(
    child: FutureBuilder(
        future: getStockTimeData(StockCode, "1d", "5d"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            final StockDetails data2 =
            StockDetails.fromJson(snapshot.data);
            List<StockGraphData> stockGraphData = [];
            final List<int> timestamp =
            data2.chart!.result![0].timestamp!;
            final List<double> indicators =
            data2.chart!.result![0].indicators!.quote![0].close!;

            if (timestamp.length == indicators.length) {
              for (int x = 0; x < timestamp.length.toInt(); x++) {
                stockGraphData.add(new StockGraphData(timestamp[x],
                    double.parse(indicators[x].toStringAsFixed(2))));
                //print(stockGraphData[x].dateTime.day);
              }
            }
            stockGraphData.toSet().toList();
            if(stockGraphData.length > 0)
            {
              return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: '5 Day Stock Analysis ${DateFormat('d/M').format(stockGraphData.first.dateTime)}-${DateFormat('d/M').format(stockGraphData.last.dateTime)}'),
                  // Enable legend
                  //legend: Legend(isVisible: true),
                  // Enable tooltip
                  //tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<StockGraphData, String>>[
                    LineSeries<StockGraphData, String>(
                        dataSource: stockGraphData,
                        xValueMapper: (StockGraphData sales, _) => "${sales.dateTime.day.toString()}/${sales.dateTime.month.toString()}",
                        yValueMapper: (StockGraphData sales, _) => sales.price,
                        name: 'Stock Price',
                        color: graphlineColor,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: false))
                  ]);
            }
          }
          return Text('Loading');
        }),
  );
}
getMonthlyDataWidgets(String StockCode, Color graphlineColor){


  return Container(
    child: FutureBuilder(
        future: getStockDataMonthly(StockCode),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            final StockDetails data2 =
            StockDetails.fromJson(snapshot.data);
            List<StockGraphData> stockGraphData = [];
            final List<int> timestamp =
            data2.chart!.result![0].timestamp!;
            final List<double> indicators =
            data2.chart!.result![0].indicators!.quote![0].close!;

            if (timestamp.length == indicators.length) {
              for (int x = 0; x < timestamp.length.toInt(); x++) {
                stockGraphData.add(new StockGraphData(timestamp[x],
                    double.parse(indicators[x].toStringAsFixed(2))));
                //print(stockGraphData[x].dateTime.day);
              }
            }
            stockGraphData.toSet().toList();
            if(stockGraphData.length > 0)
            {
              return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Monthly Stock Analysis ${DateFormat('MMMM').format(DateTime(0, stockGraphData[0].dateTime.month))}'),
                  // Enable legend
                  //legend: Legend(isVisible: true),
                  // Enable tooltip
                  //tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<StockGraphData, String>>[
                    LineSeries<StockGraphData, String>(
                        dataSource: stockGraphData,
                        xValueMapper: (StockGraphData sales, _) => "${sales.dateTime.day.toString()}/${sales.dateTime.month.toString()}",
                        yValueMapper: (StockGraphData sales, _) => sales.price,
                        name: 'Stock Price',
                        color: graphlineColor,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: false))
                  ]);
            }
          }
          return Text('Loading');
        }),
  );
}
getQuarterlyDataWidgets(String StockCode,Color graphlineColor){


  return Container(
    child: FutureBuilder(
        future: getStockTimeData(StockCode, "5d", "3mo"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            final StockDetails data2 =
            StockDetails.fromJson(snapshot.data);
            List<StockGraphData> stockGraphData = [];
            final List<int> timestamp =
            data2.chart!.result![0].timestamp!;
            final List<double> indicators =
            data2.chart!.result![0].indicators!.quote![0].close!;

            if (timestamp.length == indicators.length) {
              for (int x = 0; x < timestamp.length.toInt(); x++) {
                stockGraphData.add(new StockGraphData(timestamp[x],
                    double.parse(indicators[x].toStringAsFixed(2))));
                //print(stockGraphData[x].dateTime.day);
              }
            }
            stockGraphData.toSet().toList();
            if(stockGraphData.length > 0)
            {
              return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Quarterly Stock Analysis ${DateFormat('MMM').format(DateTime(0, stockGraphData[0].dateTime.month))}-${DateFormat('MMM').format(DateTime(0, stockGraphData.last.dateTime.month))}'),
                  // Enable legend
                  //legend: Legend(isVisible: true),
                  // Enable tooltip
                  //tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<StockGraphData, String>>[
                    LineSeries<StockGraphData, String>(
                        dataSource: stockGraphData,
                        xValueMapper: (StockGraphData sales, _) => "${sales.dateTime.day.toString()}/${sales.dateTime.month.toString()}",
                        yValueMapper: (StockGraphData sales, _) => sales.price,
                        name: 'Stock Price',
                        color: graphlineColor,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: false))
                  ]);
            }
          }
          return Text('Loading');
        }),
  );
}
getHalfYearlyDataWidgets(String StockCode,Color graphlineColor){


  return Container(
    child: FutureBuilder(
        future: getStockTimeData(StockCode, "5d", "6mo"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            final StockDetails data2 =
            StockDetails.fromJson(snapshot.data);
            List<StockGraphData> stockGraphData = [];
            final List<int> timestamp =
            data2.chart!.result![0].timestamp!;
            final List<double> indicators =
            data2.chart!.result![0].indicators!.quote![0].close!;

            if (timestamp.length == indicators.length) {
              for (int x = 0; x < timestamp.length.toInt(); x++) {
                stockGraphData.add(new StockGraphData(timestamp[x],
                    double.parse(indicators[x].toStringAsFixed(2))));
                //print(stockGraphData[x].dateTime.day);
              }
            }
            stockGraphData.toSet().toList();
            if(stockGraphData.length > 0)
            {
              return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Half Yearly Stock Analysis ${DateFormat('MMM').format(DateTime(0, stockGraphData[0].dateTime.month))}-${DateFormat('MMM').format(DateTime(0, stockGraphData.last.dateTime.month))}'),
                  // Enable legend
                  //legend: Legend(isVisible: true),
                  // Enable tooltip
                  //tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<StockGraphData, String>>[
                    LineSeries<StockGraphData, String>(
                        dataSource: stockGraphData,
                        xValueMapper: (StockGraphData sales, _) => "${sales.dateTime.day.toString()}/${sales.dateTime.month.toString()}",
                        yValueMapper: (StockGraphData sales, _) => sales.price,
                        name: 'Stock Price',
                        color: graphlineColor,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: false))
                  ]);
            }
          }
          return Text('Loading');
        }),
  );
}
getYearlyDataWidgets(String StockCode, Color graphlineColor){


  return Container(
    child: FutureBuilder(
        future: getStockTimeData(StockCode, "1mo", "1y"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            final StockDetails data2 =
            StockDetails.fromJson(snapshot.data);
            List<StockGraphData> stockGraphData = [];
            final List<int> timestamp =
            data2.chart!.result![0].timestamp!;
            final List<double> indicators =
            data2.chart!.result![0].indicators!.quote![0].close!;

            if (timestamp.length == indicators.length) {
              for (int x = 0; x < timestamp.length.toInt(); x++) {
                stockGraphData.add(new StockGraphData(timestamp[x],
                    double.parse(indicators[x].toStringAsFixed(2))));
                //print(stockGraphData[x].dateTime.day);
              }
            }
            stockGraphData.toSet().toList();
            if(stockGraphData.length > 0)
            {
              return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Yearly Stock Analysis ${DateFormat('YYYY').format(DateTime(0, stockGraphData[0].dateTime.year))}'),
                  // Enable legend
                  //legend: Legend(isVisible: true),
                  // Enable tooltip
                  //tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<StockGraphData, String>>[
                    LineSeries<StockGraphData, String>(
                        dataSource: stockGraphData,
                        xValueMapper: (StockGraphData sales, _) => "${sales.dateTime.day.toString()}/${sales.dateTime.month.toString()}",
                        yValueMapper: (StockGraphData sales, _) => sales.price,
                        name: 'Stock Price',
                        color: graphlineColor,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: false))
                  ]);
            }
          }
          return Text('Loading');
        }),
  );
}
get2YearsDataWidgets(String StockCode, Color graphlineColor){


  return Container(
    child: FutureBuilder(
        future: getStockTimeData(StockCode, "1mo", "2y"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            final StockDetails data2 =
            StockDetails.fromJson(snapshot.data);
            List<StockGraphData> stockGraphData = [];
            final List<int> timestamp =
            data2.chart!.result![0].timestamp!;
            final List<double> indicators =
            data2.chart!.result![0].indicators!.quote![0].close!;

            if (timestamp.length == indicators.length) {
              for (int x = 0; x < timestamp.length.toInt(); x++) {
                stockGraphData.add(new StockGraphData(timestamp[x],
                    double.parse(indicators[x].toStringAsFixed(2))));
                //print(stockGraphData[x].dateTime.day);
              }
            }
            stockGraphData.toSet().toList();
            if(stockGraphData.length > 0)
            {
              return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: '2 Years Stock Analysis ${DateFormat('y').format(stockGraphData[0].dateTime)}-${DateFormat('y').format(stockGraphData.last.dateTime)}'),
                  // Enable legend
                  //legend: Legend(isVisible: true),
                  // Enable tooltip
                  //tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<StockGraphData, String>>[
                    LineSeries<StockGraphData, String>(
                        dataSource: stockGraphData,
                        xValueMapper: (StockGraphData sales, _) => "${sales.dateTime.month.toString()}/${sales.dateTime.year.toString()}",
                        yValueMapper: (StockGraphData sales, _) => sales.price,
                        name: 'Stock Price',
                        color: graphlineColor,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: false))
                  ]);
            }
          }
          return Text('Loading');
        }),
  );
}
get5YearsDataWidgets(String StockCode, Color graphlineColor){


  return Container(
    child: FutureBuilder(
        future: getStockTimeData(StockCode, "3mo", "5y"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            final StockDetails data2 =
            StockDetails.fromJson(snapshot.data);
            List<StockGraphData> stockGraphData = [];
            final List<int> timestamp =
            data2.chart!.result![0].timestamp!;
            final List<double> indicators =
            data2.chart!.result![0].indicators!.quote![0].close!;

            if (timestamp.length == indicators.length) {
              for (int x = 0; x < timestamp.length.toInt(); x++) {
                stockGraphData.add(new StockGraphData(timestamp[x],
                    double.parse(indicators[x].toStringAsFixed(2))));
                //print(stockGraphData[x].dateTime.day);
              }
            }
            stockGraphData.toSet().toList();
            if(stockGraphData.length > 0)
            {
              return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: '5 Year Stock Analysis ${DateFormat('y').format(stockGraphData[0].dateTime)}-${DateFormat('y').format(stockGraphData.last.dateTime)}'),
                  // Enable legend
                  //legend: Legend(isVisible: true),
                  // Enable tooltip
                  //tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<StockGraphData, String>>[
                    LineSeries<StockGraphData, String>(
                        dataSource: stockGraphData,
                        xValueMapper: (StockGraphData sales, _) => "${sales.dateTime.month.toString()}/${sales.dateTime.year.toString()}",
                        yValueMapper: (StockGraphData sales, _) => sales.price,
                        name: 'Stock Price',
                        color: graphlineColor,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: false))
                  ]);
            }
          }
          return Text('Loading');
        }),
  );
}
