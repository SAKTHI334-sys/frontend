import 'package:flutter/material.dart';

class GstInclusiveExclusiveCalculator extends StatefulWidget {
  const GstInclusiveExclusiveCalculator({super.key});

  @override
  State<GstInclusiveExclusiveCalculator> createState() => _GstInclusiveExclusiveCalculatorState();
}

class _GstInclusiveExclusiveCalculatorState extends State<GstInclusiveExclusiveCalculator> {
  TextEditingController _controller = TextEditingController();

  String price = "";
  double gstRate = 0.0;
  String result = "";
  bool isInclusive = false; // Toggle for GST type

  void numClick(String num) {
    setState(() {
      price += num;
      _controller.text = price;
    });
  }

  void gstClick(String rate) {
    setState(() {
      gstRate = double.tryParse(rate) ?? 0;
    });
  }

  void calculate() {
    setState(() {
      double value = double.tryParse(price) ?? 0;
      double base = 0.0;
      double gstAmount = 0.0;
      double total = 0.0;

      if (isInclusive) {
        base = value / (1 + gstRate / 100);
        gstAmount = value - base;
        total = value;
      } else {
        base = value;
        gstAmount = base * gstRate / 100;
        total = base + gstAmount;
      }

      result =
      "Mode: ${isInclusive ? "Inclusive" : "Exclusive"}\n"
          "Base = ₹${base.toStringAsFixed(2)}\n"
          "GST @ ${gstRate.toStringAsFixed(0)}% = ₹${gstAmount.toStringAsFixed(2)}\n"
          "Total = ₹${total.toStringAsFixed(2)}";

      _controller.text = total.toStringAsFixed(2);
    });
  }

  void clear() {
    setState(() {
      price = "";
      gstRate = 0.0;
      result = "";
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GST Inclusive & Exclusive Calculator")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _controller,
                readOnly: true,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Price",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Exclusive"),
                Switch(
                  value: isInclusive,
                  onChanged: (val) {
                    setState(() {
                      isInclusive = val;
                    });
                  },
                ),
                Text("Inclusive"),
              ],
            ),

            const SizedBox(height: 10),

            buttonRow(["7", "8", "9", "5%"], [false, false, false, true]),
            buttonRow(["4", "5", "6", "12%"], [false, false, false, true]),
            buttonRow(["1", "2", "3", "18%"], [false, false, false, true]),
            buttonRow(["C", "0", "=", "28%"], [true, false, true, true]),

            if (result.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buttonRow(List<String> texts, List<bool> isFunction) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(texts.length, (index) {
          return ElevatedButton(
            onPressed: () {
              String text = texts[index];
              if (isFunction[index]) {
                if (text == "C") clear();
                else if (text == "=") calculate();
                else gstClick(text.replaceAll("%", ""));
              } else {
                numClick(text);
              }
            },
            child: Text(texts[index], style: TextStyle(fontSize: 20)),
          );
        }),
      ),
    );
  }
}
