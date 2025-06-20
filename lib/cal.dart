import 'package:flutter/material.dart';

class nikas extends StatefulWidget {
  const nikas({super.key});

  @override
  State<nikas> createState() => _nikasState();
}

class _nikasState extends State<nikas> {
  TextEditingController _controller = TextEditingController();

  String val1 = "";
  String val2 = "";
  String optr = "";
  bool clk = false;

  void numClick(String num) {
    setState(() {
      if (!clk) {
        val1 += num;
        _controller.text = val1;
      } else {
        val2 += num;
        _controller.text = val2;
      }
    });
  }

  void operatorClick(String op) {
    setState(() {
      optr = op;
      clk = true;
    });
  }

  void calculate() {
    setState(() {
      double result = 0;
      int a = int.tryParse(val1) ?? 0;
      int b = int.tryParse(val2) ?? 0;

      switch (optr) {
        case "+":
          result = (a + b) as double;
          break;
        case "-":
          result = (a - b) as double;
          break;
        case "*":
          result = (a * b) as double;
          break;
        case "/":
          result = b != 0 ? a / b : 0;
          break;
        default:
          result = 0;
      }

      _controller.text = result.toString();
      val1 = result.toString();
      val2 = "";
      clk = false;
    });
  }

  void clear() {
    setState(() {
      val1 = "";
      val2 = "";
      optr = "";
      clk = false;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _controller,
              readOnly: true,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: OutlineInputBorder(),

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
                  onPressed: () => operatorClick("+"),
                  child: Text("+", style: TextStyle(fontSize: 20)),
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
                  onPressed: () => operatorClick("-"),
                  child: Text("-", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),

          // Row 3
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Row(
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
                      onPressed: () => operatorClick("*"),
                      child: Text("*", style: TextStyle(fontSize: 20)),
                    ),
                  ],
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
                  onPressed: () => operatorClick("÷"),
                  child: Text("÷", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => operatorClick("."), 
                  child: Text(".",style: TextStyle(fontSize: 20),)),
            ],
          ),
          
        




        ],
      ),
    );
  }
}
