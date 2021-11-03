import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:virtualstocktrader/Apis/ApiCalls.dart';
import 'package:virtualstocktrader/AppThemes/AppThemes.dart';


import "package:http/http.dart" as http;
import 'package:virtualstocktrader/Data/StockDetails.dart';
typedef void IntCallback(int n);

class StockBuyPage extends StatefulWidget {
  final String StockName;
  final String StockCode;

  const StockBuyPage(
      {Key? key, required this.StockName, required this.StockCode})
      : super(key: key);

  @override
  State<StockBuyPage> createState() => _StockBuyPageState();
}

class _StockBuyPageState extends State<StockBuyPage> {
  bool hasData = false;
  int num=0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    void updateNumber(int n) {
      setState(() {
        num = n;
      });
    }
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(
              left: (width * 0.025),
              top: (height * 0.07),
              right: (width * 0.025),
              bottom: (height * 0.025)),
          child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  expandedHeight: height * 0.002,
                  backgroundColor: AppThemes.primaryColor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  elevation: 0.0,
                ),
                FutureBuilder(
                  future: getStockData(widget.StockCode),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final StockDetails data =
                          StockDetails.fromJson(snapshot.data);
                      final Meta metaData = data.chart!.result![0].meta!;
                      double diff = metaData.regularMarketPrice! -
                          metaData.chartPreviousClose!;
                      final double diffPer = double.parse(
                          (diff * 100 / metaData.chartPreviousClose!)
                              .toStringAsFixed(2));
                      diff = double.parse(diff.toStringAsFixed(2));
                      IconData statusIcon = diff >= 0
                          ? Icons.arrow_circle_up
                          : Icons.arrow_circle_down;
                      Color statusColor = diff >= 0
                          ? AppThemes.chateauGreen
                          : AppThemes.pomegranate;
                      return SliverToBoxAdapter(
                          child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.05, horizontal: width * 0.05),
                        child: Column(
                          children: [
                            Text(
                              widget.StockName,
                              style: TextStyle(fontSize: width * 0.075),
                            ),
                            SizedBox(
                              height: height * 0.025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.StockCode,
                                  style: TextStyle(fontSize: width * 0.06),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      metaData.regularMarketPrice.toString(),
                                      style: TextStyle(fontSize: width * 0.06),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${diff}(${diffPer}%)",
                                          style: TextStyle(
                                              fontSize: width * 0.06,
                                              color: statusColor),
                                        ),
                                        Icon(
                                          statusIcon,
                                          color: statusColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: num>0?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
                              children: [
                                if(num>0)NumericInput(
                                  onNumberChanged: (int n) {
                                    updateNumber(n);
                                  },
                                  currentNumber: num,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: AppThemes.secondaryColor,
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.05),
                                  ),
                                  child: Text(
                                    "Buy Stock",
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    if(num==0){setState(() {
                                      num++;
                                    });}
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ));
                    } else {
                      return SliverToBoxAdapter(
                        child: Text('Loading Data'),
                      );
                    }
                  },
                ),
              ]))),
    );
  }
}





class NumericInput extends StatelessWidget{
  final IntCallback onNumberChanged;
  int currentNumber;
  NumericInput({Key? key, required this.onNumberChanged,required this.currentNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(
        color: AppThemes.primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove_circle,color: AppThemes.pomegranate,),
            onPressed: () {
              if(currentNumber>0)
                {
                  currentNumber--;
                  onNumberChanged(currentNumber);
                }
            },
          ),
          Text(currentNumber.toString(), style: TextStyle(color: AppThemes.lightColor),),
          IconButton(
            icon: Icon(Icons.add_circle,color: AppThemes.chateauGreen,),
            onPressed: () {
              currentNumber+=1;
              onNumberChanged(currentNumber);
            },
          ),
        ],
      ),
    );
  }

}
