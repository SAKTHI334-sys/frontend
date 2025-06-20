import 'package:flutter/material.dart';

class spotify extends StatefulWidget {
  const spotify({super.key});

  @override
  State<spotify> createState() => _spotifyState();
}

class _spotifyState extends State<spotify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext,bool)
        {
          return [
            SliverAppBar(
              expandedHeight: 400,
              backgroundColor: Color(0xfff975f2e),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    SizedBox(width: 450,
                      child: Row(
                        children: [
                          SizedBox(width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIconColor: Colors.black,
                                prefixIcon: Icon(Icons.search,color: Colors.black,),
                                hintText: "Find on this page",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("peq/img_11.png"),

                    )
                  ],
                ),
              ),
            ),
          ];
        },
          body: Column(
            
            
            

          ),
      )
    );
  }
}


