import 'package:flutter/material.dart';

class CustomCounterWidget extends StatefulWidget {
  final int counterValue;
  final Function(int) onValueChanged;

  const CustomCounterWidget({
    Key? key,
    required this.counterValue,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomCounterWidgetState createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  void _incrementCounter() {
    widget.onValueChanged(widget.counterValue + 1);
  }

  void _decrementCounter() {
    if (widget.counterValue > 0) {
      widget.onValueChanged(widget.counterValue - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 60,
      color: Colors.blue, // Replace with your desired background color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: _decrementCounter,
            icon: const Icon(Icons.remove),
            color: Colors.white, // Replace with your desired icon color
          ),
          Text(
            widget.counterValue.toString(),
            style: const TextStyle(
              color: Colors.white, // Replace with your desired text color
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: _incrementCounter,
            icon: const Icon(Icons.add),
            color: Colors.white, // Replace with your desired icon color
          ),
        ],
      ),
    );
  }
}
