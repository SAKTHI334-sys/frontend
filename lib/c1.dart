import 'package:flutter/material.dart';
class rew extends StatelessWidget {
  const rew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blue,
       appBar: AppBar(
         title: Text("UG graduation"),
         backgroundColor: Colors.blueGrey,
       ),
      body: Column(
         children: [
           Container(
             height: 200,
             width: 180,
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage("peq/img_1.png")),
             ),
           ),
           Container(
             height: 300,
             width: 400,
             decoration: BoxDecoration(
               color: Colors.white,
               border: Border.all(),
               borderRadius: BorderRadius.circular(35),
             ),
             child: Column(
               children: [
                  Center(child: Text("LOGIN"),),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     decoration: InputDecoration(
                       labelText: "Email",
                       labelStyle: TextStyle(color: Colors.blue),
                       filled: true ,
                       fillColor: Colors.lightBlueAccent,
                       border: OutlineInputBorder(),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     decoration: InputDecoration(
                       labelText: "Password",
                       labelStyle: TextStyle(color: Colors.blue),
                       filled: true,
                       fillColor: Colors.lightBlueAccent,
                       border: OutlineInputBorder(),
                     ),
                   ),
                 ),
                 Text("Forget password"),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ElevatedButton(onPressed: (){}, child: Text("Login")),
                 ),
                 Text("Login into your email id for verification"),

             ]
             )


           ),
]
           ),




     );


  }
}
