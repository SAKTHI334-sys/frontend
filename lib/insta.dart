import 'package:flutter/material.dart';

import 'mm.dart';



class lite extends StatefulWidget {
  const lite({super.key});

  @override
  State<lite> createState() => _liteState();
}

class _liteState extends State<lite> {

  bool isSwitched = false;
  void _toggleSwitch(bool value)
  {
    setState(() {
      isSwitched = value;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Text(
                "Sakss24", style: TextStyle(fontWeight: FontWeight.bold)),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
        actions: const [
          Icon(Icons.link),
          SizedBox(width: 16),
          Icon(Icons.add_box_outlined),
          SizedBox(width: 16),
          Icon(Icons.menu),
          SizedBox(width: 10),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return [SliverAppBar(
                expandedHeight: 350,
                pinned: true,
                floating: false,
                backgroundColor: Colors.black,
                leading: Icon(Icons.arrow_back, color: Colors.white,),
                flexibleSpace: FlexibleSpaceBar(

                  background: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: AssetImage("peq/img_12.png")),
                            ),
                          ),
                          Column(
                            children: [
                              Text("12.1K", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),),
                              Text("posts", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),)
                            ],

                          ),
                          Column(
                            children: [
                              Text("1.6M", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),),
                              Text("Followers", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),)

                            ],
                          ),
                          Column(
                            children: [
                              Text("337", style: TextStyle(color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),),
                              Text("Following", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),)
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("Sakshi",
                                style: TextStyle(color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("all about the stars",
                                style: TextStyle(color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text("www.saks.com",
                                    style: TextStyle(color: Colors.blue),))


                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(),
                                  ),
                                  child: Center(
                                      child: Text("Following", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text("Message", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(),
                                    border: Border.all(),
                                  ),
                                  child: Icon(Icons.person_add, size: 20,
                                    color: Colors.white,),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                bottom: TabBar(tabs: [
                  Tab(icon: Icon(Icons.more_vert, color: Colors.white,),),
                  Tab(icon: Icon(
                    Icons.video_collection_outlined, color: Colors.white,),),
                  Tab(icon: Icon(Icons.person_add, color: Colors.white,),)

                ]

                ),
              ),
              ];
            },


            body: TabBarView(
                children: [
                  Container(
                    height: 200,
                    color: Colors.black,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 2,
                            childAspectRatio: 0.65),
                        itemCount: lisd.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              //Text(data)
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    image: DecorationImage(
                                      image: AssetImage(lisd[index].image),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),

                            ],
                          );
                        }),


                  ),
                  Container(
                    height: 200,
                    color: Colors.black,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 2,
                            childAspectRatio: 0.65),
                        itemCount: a.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              //Text(data)
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    image: DecorationImage(
                                      image: AssetImage(a[index].image),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),

                            ],
                          );
                        }),
                  ),
                  Container(
                    height: 200,
                    color: Colors.black,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 2,
                            childAspectRatio: 0.65),
                        itemCount: a.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              //Text(data)
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    image: DecorationImage(
                                      image: AssetImage(a[index].image),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),

                            ],
                          );
                        }),
                  ),
                ]


            )),
      ),
    );
  }
  }