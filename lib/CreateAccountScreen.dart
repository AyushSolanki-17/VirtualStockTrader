import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtualstocktrader/AppThemes/AppThemes.dart';
import 'package:virtualstocktrader/Data/Database.dart';
import 'package:virtualstocktrader/Data/User.dart';
import 'package:virtualstocktrader/main.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController usernameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.05, horizontal: width * 0.1),
          child: Center(
            child: Column(children: [
              Image.asset("assets/icons/vst-transparent.png"),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Enter a username",
                  label: Text("Username"),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: AppThemes.primaryColorDark,
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              ElevatedButton(
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: width * 0.045),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppThemes.primaryColorLight),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                          horizontal: width * 0.15, vertical: height * 0.025)),
                ),
                onPressed: () async{
                  try{
                    User user = new User.newUser(usernameController.text, 15000.00);
                    user = await DBProvider.db.newUser(user);
                    Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(builder: (context) => SecondarySplash()),
                            (route) => false);
                  }
                  catch(e)
                  {
                    print(e.hashCode);
                  }
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
