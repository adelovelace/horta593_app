import 'package:flutter/material.dart';
import 'package:horta593app/constants/global_variables.dart';

class CustomTexField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String header;
  final bool hidden;

  const CustomTexField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.header,
      this.hidden = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        TextFormField(
          obscureText: hidden,
          style: TextStyle(color: GlobalVariables.greyGaluchi),
          controller: controller,
          decoration: InputDecoration(
              labelStyle: TextStyle(color: GlobalVariables.greyGaluchi),
              labelText: header,
              contentPadding: new EdgeInsets.all(10),
              hintStyle: TextStyle(color: GlobalVariables.greyGaluchi),
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: GlobalVariables.greyGaluchi,
              )),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: GlobalVariables.greyGaluchi,
              ))),
          validator: (val) {},
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
