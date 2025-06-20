import 'package:flutter/material.dart';

class spot
{
  String? image;
  String? text;

  spot(this.image,this.text);


}
List lis4=datas.map((e)=>spot(e["image"],e["text"])).toList();

var datas=[
  {"image":"peq/img_5.png","text":"offers at 90"},
  {"image":"peq/img_6.png","text":"offers at 15"},
  {"image":"peq/img_7.png","text":"off at 25"},
  {"image":"peq/img_9.png","text":"off at 56"}

];
class sam
{
  String? image;
  String? text;

  sam(this.image,this.text);


}
List lis1=datass.map((e)=>spot(e["image"],e["text"])).toList();

var datass=[
  {"image":"peq/img_10.png","text":"offers at 78"}
];