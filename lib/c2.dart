import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'd3.dart';


class rox extends StatefulWidget {
  const rox({super.key});

  @override
  State<rox> createState() => _roxState();
}

class _roxState extends State<rox> {
  get callbackFunction => null;

  get child => null;

  get liss => null;

  @override
  Widget build(BuildContext context, ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff87d7e1),
        title: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIconColor: Colors.black,
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            hintText: "Search or ask a question",
            suffixIcon: SizedBox(width: 85,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.camera_alt,color: Colors.black,),
                  ),
                  Icon(Icons.mic,color: Colors.black,)
                ],
              ),
            )
          ),
          ),
        actions: [
           Icon(Icons.qr_code_scanner),
            ],
          ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 450,
                color: Color(0xfffc4eee6),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.location_pin),
                    ),
                    Text("Delivering to Mumbai 400001-Update location")
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lis1.length,
                  itemBuilder: (BuildContext,index){
                    {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: 500,

                                 decoration: BoxDecoration(
                                   image: DecorationImage(image: AssetImage(lis1[index].image),
                                 fit: BoxFit.fill,),
                                 ),
                              ),
                              Text("IMG")
                            ],
                          ),);
                    }
                  },
                ),

              ),

              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16/9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal
                ),
                itemCount: 5,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Container(
                  height: 300,
                  width: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("peq/img_3.png"),
                    fit: BoxFit.fill,
                    ),
                  ),
                    ),

                  ),
              SizedBox(
                height: 700,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 1,crossAxisSpacing: 1),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int itemIndex)
                  {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                              height: 80,
                              width:70,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(lis4[itemIndex].image))
                                ),

                              )
                          
                        ),);
                  },
                )
              ),
              




]
              )
    )
    );









  }
}





      

