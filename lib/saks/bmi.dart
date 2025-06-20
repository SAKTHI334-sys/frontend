import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  String height = ""; // in cm
  String weight = ""; // in kg
  String result = "";

  bool isHeightSelected = true;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void numClick(String num) {
    setState(() {
      if (isHeightSelected) {
        height += num;
        heightController.text = height;
      } else {
        weight += num;
        weightController.text = weight;
      }
    });
  }

  void clear() {
    setState(() {
      height = "";
      weight = "";
      result = "";
      heightController.clear();
      weightController.clear();
    });
  }

  void calculate() {
    setState(() {
      double h = double.tryParse(height) ?? 0;
      double w = double.tryParse(weight) ?? 0;

      if (h == 0 || w == 0) {
        result = "Enter valid height and weight.";
        return;
      }

      double heightInMeters = h / 100;
      double bmi = w / (heightInMeters * heightInMeters);

      String category = "";
      if (bmi < 18.5)
        category = "Underweight";
      else if (bmi < 24.9)
        category = "Normal weight";
      else if (bmi < 29.9)
        category = "Overweight";
      else
        category = "Obese";

      result = "BMI: ${bmi.toStringAsFixed(2)}\nCategory: $category";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: heightController,
                readOnly: true,
                onTap: () {
                  setState(() => isHeightSelected = true);
                },
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: "Enter Height (cm)",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isHeightSelected ? Colors.blue : Colors.grey,
                          width: 2)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: weightController,
                readOnly: true,
                onTap: () {
                  setState(() => isHeightSelected = false);
                },
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: "Enter Weight (kg)",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: !isHeightSelected ? Colors.blue : Colors.grey,
                          width: 2)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            buttonRow(["7", "8", "9", "C"], [false, false, false, true]),
            buttonRow(["4", "5", "6", "."], [false, false, false, false]),
            buttonRow(["1", "2", "3", "="], [false, false, false, true]),
            buttonRow(["0", "00", "", ""], [false, false, false, false]),

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
          String text = texts[index];
          if (text.isEmpty) return SizedBox(width: 64); // empty placeholder
          return ElevatedButton(
            onPressed: () {
              if (isFunction[index]) {
                if (text == "C") clear();
                else if (text == "=") calculate();
              } else {
                numClick(text);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            ),
            child: Text(texts[index], style: TextStyle(fontSize: 20)),
          );
        }),
      ),
    );
  }
}
