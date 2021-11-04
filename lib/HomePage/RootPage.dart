import 'package:flutter/cupertino.dart';
import 'package:virtualstocktrader/Data/User.dart';
import 'package:virtualstocktrader/HomePage/HomePage.dart';

class RootInheritedWidget extends InheritedWidget{

  User? user;
  final Widget child;

  RootInheritedWidget({Key? key, this.user, required this.child})
      : super(key: key, child: child);

  static RootInheritedWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<RootInheritedWidget>())!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

}