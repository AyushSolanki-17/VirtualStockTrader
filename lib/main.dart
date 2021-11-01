//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualstocktrader/AppThemes/AppThemes.dart';
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
              home: HomePage());
        },
      );
}
