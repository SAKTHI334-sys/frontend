import 'package:flutter/material.dart';

class GstCalculator extends StatefulWidget {
  const GstCalculator({super.key});

  @override
  State<GstCalculator> createState() => _GstCalculatorState();
}

class _GstCalculatorState extends State<GstCalculator> {
  TextEditingController _controller = TextEditingController();

  String price = "";
  double gstRate = 0.0;
  String result = "";

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
      double base = double.tryParse(price) ?? 0;
      double gstAmount = base * gstRate / 100;
      double total = base + gstAmount;
      result =
      "GST @ ${gstRate.toStringAsFixed(0)}% = ₹${gstAmount.toStringAsFixed(2)}\nTotal = ₹${total.toStringAsFixed(2)}";
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
      appBar: AppBar(title: Text("GST Calculator")),
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
            const SizedBox(height: 10),

            // Row 1
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => numClick("7"),
                    child: Text("7", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => numClick("8"),
                    child: Text("8", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => numClick("9"),
                    child: Text("9", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => gstClick("5"),
                    child: Text("5%", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),

            // Row 2
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => numClick("4"),
                    child: Text("4", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => numClick("5"),
                    child: Text("5", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => numClick("6"),
                    child: Text("6", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => gstClick("12"),
                    child: Text("12%", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),

            // Row 3
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => numClick("1"),
                    child: Text("1", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => numClick("2"),
                    child: Text("2", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => numClick("3"),
                    child: Text("3", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => gstClick("18"),
                    child: Text("18%", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),

            // Row 4
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: clear,
                    child: Text("C", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => numClick("0"),
                    child: Text("0", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: calculate,
                    child: Text("=", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () => gstClick("28"),
                    child: Text("28%", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),

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
}
