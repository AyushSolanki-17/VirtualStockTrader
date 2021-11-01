import 'package:flutter/material.dart';
import 'package:virtualstocktrader/AppThemes/AppThemes.dart';
import 'package:virtualstocktrader/SettingsPage/SettingsPage.dart';

class HomePage extends StatelessWidget {
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
          child: CustomScrollView(
            slivers: [
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
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppThemes.primaryColorLight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: AppThemes.primaryColorLight),
                  margin: EdgeInsets.symmetric(vertical: height * 0.05),
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.05, horizontal: width * 0.025),
                  child: Column(
                    children: [
                      Text('Welcome Back',
                          style: TextStyle(fontSize: width * 0.07)),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Text('Ayush',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.1)),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Text('Current Balance \$50',
                          style: TextStyle(fontSize: width * 0.07)),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Your Stocks',
                  style: TextStyle(fontSize: width * 0.07),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
            children: [
              DrawerListTile(
                displayText: "Settings",
                screenHeight: height,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              )
            ],
          )),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String displayText;
  final Function onPressed;
  final double screenHeight;

  const DrawerListTile(
      {Key? key,
        required this.displayText,
        required this.onPressed,
        required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings),
          SizedBox(
            width: 5.0,
          ),
          Text(
            displayText,
            style: TextStyle(fontSize: screenHeight * 0.025),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
