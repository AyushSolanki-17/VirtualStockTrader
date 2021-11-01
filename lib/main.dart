import 'package:flutter/material.dart';
import 'package:virtualstocktrader/AppThemes/AppThemes.dart';

void main() {
  runApp(VirtualStockTrader());
}

class VirtualStockTrader extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Stock Trader',
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Virtual Stock Trader'),
      ),
    );
  }

}
