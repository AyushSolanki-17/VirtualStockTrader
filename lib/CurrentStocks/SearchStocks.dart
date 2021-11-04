import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:virtualstocktrader/Apis/ApiCalls.dart';
import 'package:virtualstocktrader/AppThemes/AppThemes.dart';
import 'dart:convert' as convert;
import "package:http/http.dart" as http;
import 'package:virtualstocktrader/CurrentStocks/StockBuyPage.dart';

class SearchStocksPage extends StatefulWidget {
  @override
  State<SearchStocksPage> createState() => _SearchStocksPageState();
}

class _SearchStocksPageState extends State<SearchStocksPage> {
  List<dynamic>? stockList;
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                SliverToBoxAdapter(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.025, horizontal: width * 0.005),
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(color: AppThemes.primaryColor),
                        decoration: InputDecoration(
                            hintText: "Search for Stocks...",
                            hintStyle: TextStyle(color: AppThemes.primaryColor),
                            label: Text("Search",style: TextStyle(color: AppThemes.primaryColor),),
                            focusColor: AppThemes.primaryColorDark,
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: AppThemes.athensGray,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search, color: AppThemes.primaryColor,),
                              onPressed: () async {
                                var stocklist = await getStocks(searchController.text);
                                setState(() {
                                  stockList = stocklist;
                                });
                              },
                            )),
                      ),
                    ),
                  ),
                ),
                //SizedBox(height: height*0.025,),
                if(stockList!=null)SliverList(

                    delegate: SliverChildBuilderDelegate(
                  (context, stocklist) {
                    try{
                    return StockCardTile(
                      StockName: stockList![stocklist]["shortName"].toString(),
                        StockCode: stockList![stocklist]["symbol"].toString(), StockPrice: stockList![stocklist]["regularMarketPrice"]["raw"]);
                  }
                  catch(e){
                  }
                  },
                      childCount: stockList!.length,
                ),
                ),
              ]))),
    );
  }
}

class StockCardTile extends StatelessWidget {
  final String StockName;
  final String StockCode;
  final double StockPrice;

  const StockCardTile(
      {Key? key, required this.StockName, required this.StockCode, required this.StockPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppThemes.dodgerBlue,
          border: Border.all(color: AppThemes.secondaryColorDark, width: 1.0),
          borderRadius: BorderRadius.circular(15.0)),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${this.StockName}"),
                Text("${this.StockCode}"),

              ],
            ),
            Text("${this.StockPrice}"),
          ],
        ),
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StockBuyPage(StockName: this.StockName,StockCode: this.StockCode)));
        },
      ),
    );
  }
}

