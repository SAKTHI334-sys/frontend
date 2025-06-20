import 'package:flutter/material.dart';

class rex extends StatefulWidget {
  const rex({super.key});

  @override
  State<rex> createState() => _rexState();
}

class _rexState extends State<rex> {


  TextEditingController _controller = TextEditingController();

  String val1 = "",
      val2 = "",
      optr = "";

  bool clk = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
            readOnly: true,
            textAlign: TextAlign.right,

          ),
          SizedBox(height: 50,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                 if(clk)
                   {
                     val2 = "1";
                     _controller.text = val2;
                   }
                 else
                   {
                     val1 = "1";
                     _controller.text = val1;
                   }
              }, child: Text("1")),
              ElevatedButton(onPressed: () {
                if(clk)
                {
                  val2 = "2";
                  _controller.text = val2;
                }
                else
                {
                  val1 = "2";
                  _controller.text = val1;
                }
              }, child: Text("2")),
              ElevatedButton(onPressed: () {
                _controller.text ="+";
                optr = "+";
                clk = true;

              }, child: Text("+")),
              ElevatedButton(onPressed: () {

                if(optr == "+")
                  {
                    int a = int.parse(val1);
                    int b = int.parse(val2);

                    int res = a+ b;

                    _controller.text = res.toString();


                  }
                if(optr == "-")
                {
                  int a = int.parse(val1);
                  int b = int.parse(val2);

                  int res = a - b;

                  _controller.text = res.toString();


                }
              }, child: Text("=")),

            ],
          )


        ],
      ),
    );
  }

}






