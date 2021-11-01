import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualstocktrader/AppThemes/AppThemes.dart';

class SettingsPage extends StatelessWidget {

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
                  child: Center(child: ThemeSwitch(),),
                ),
              ]
              )
          )
      ),
    );
  }
}

class ThemeSwitch extends StatefulWidget{
  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool dark=false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MergeSemantics(
      child: ListTile(
        title: const Text('Dark Mode'),
        trailing: CupertinoSwitch(
          value: themeProvider.isDarkMode,
          onChanged: (bool value) {
            final provider = Provider.of<ThemeProvider>(context,listen: false);
            provider.toggleTheme(value);
          },
        ),
        onTap: () { setState(() { dark = !dark; }); },
      ),
    );
  }
}
