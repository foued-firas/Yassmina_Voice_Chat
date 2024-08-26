import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voice_chat/pallette.dart';

class FeatureBox extends StatelessWidget {
  const FeatureBox({super.key, required this.color, required this.headerText, required this.description});
  final Color color ;
  final String headerText;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ) 
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20).copyWith(
          left: 15,
        ),
        child: Column(
          children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(headerText,
            style: TextStyle(
              fontFamily: 'Cera Pro',
              color: Pallete.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          SizedBox(height: 3,),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(description,
            style: TextStyle(
              fontFamily: 'Cera Pro',
              color: Pallete.blackColor,
              fontSize: 15
             
            ),),
          ),
        ],
        ),
      ),
    );
  }
}