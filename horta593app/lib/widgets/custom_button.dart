import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool dark;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, this.dark = false, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (dark)
      {
        return ElevatedButton(
          onPressed: onTap,
          child: Text(text),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  GlobalVariables.primarybackground
              ),
              shadowColor: MaterialStateProperty.all(
                  GlobalVariables.secondaryColor
              )
          ),
        );
      }
    else {
      return ElevatedButton(
        onPressed: onTap,
        child: Text(text),
      );
    }
  }
}
