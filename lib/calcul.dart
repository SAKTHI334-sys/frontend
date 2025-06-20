import 'package:flutter/material.dart';



class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // TextEditingController to control the TextFormField
  TextEditingController _controller = TextEditingController();

  // String to store the current text
  String displayText = '';

  // Button press handler
  void buttonPressed(String text) {
    setState(() {
      displayText += text;
      _controller.text = displayText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _controller,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Output',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => buttonPressed("1"),
            child: Text("1"),
          ),
          // You can add more buttons like this
        ],
      ),
    );
  }
}
