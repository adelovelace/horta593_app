import 'package:flutter/material.dart';
import 'package:horta593app/widgets/custom_button.dart';
import 'package:horta593app/constants/global_variables.dart';
import 'package:horta593app/screens/login/login_screen.dart';
import 'package:horta593app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Horta593',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.primarybackground,
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor)),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Scaffold(
            body: ListView(
          children: [
            SizedBox(height: 150),
            Center(
              child: const Image(
                image: AssetImage('lib/constants/images/logo_dark.png'),
              ),
            ),
            SizedBox(height: 80),
            Builder(builder: (context) {
              return Container(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: CustomButton(
                    text: "Empezar!",
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    }),
              );
            })
          ],
        )));
  }
}
