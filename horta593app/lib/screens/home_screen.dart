import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horta593app/blocs/auth/auth_bloc.dart';
import 'package:horta593app/widgets/custom_button.dart';
import 'package:horta593app/screens/login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
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
        ));
      },
    );
  }
}
