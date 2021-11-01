//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualstocktrader/AppThemes/AppThemes.dart';
import 'package:virtualstocktrader/CreateAccountScreen.dart';
import 'package:virtualstocktrader/Data/Database.dart';
import 'package:virtualstocktrader/Data/User.dart';
import 'package:virtualstocktrader/HomePage/HomePage.dart';

void main() {
  runApp(VirtualStockTrader());
}

class VirtualStockTrader extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Virtual Stock Trader',
              themeMode: themeProvider.themeMode,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              home: SecondarySplash());
        },
      );
}

class SecondarySplash extends StatefulWidget {
  @override
  State<SecondarySplash> createState() => _SecondarySplashState();
}

class _SecondarySplashState extends State<SecondarySplash> {
  @override
  void initState() {
    // TODO: implement initState
    checkUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      body: Center(
        child: Image.asset("assets/icons/vst-transparent.png"),
      ),
    );
  }

  void checkUser(BuildContext context) async {
    int userCount = await DBProvider.db.checkUserExists();
    if (userCount > 0) {
      User user = await DBProvider.db.getFirstUser();
      Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(builder: (context) => HomePage(user: user,)),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(builder: (context) => CreateAccountScreen()),
          (route) => false);
    }
  }
}
