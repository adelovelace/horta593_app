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
                  width: 400,
                  height: 400,
                  image: AssetImage('lib/constants/images/logo_dark.png'),
              ),
            ),
            SizedBox(height: 200),
            Builder(builder: (context) {
              return Container(
                padding: const EdgeInsets.only(left: 160, right: 160),
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
