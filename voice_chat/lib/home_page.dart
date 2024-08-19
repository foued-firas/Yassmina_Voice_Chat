import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voice_chat/pallette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Allen'),
        leading: const Icon(Icons.menu),
        centerTitle: true,
       

      ),
      body: Column(
        children: [
          //profil part
          Stack(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  margin: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Pallete.assistantCircleColor,
                    shape: BoxShape.circle
                  ),
                ),
              ),
              Container(
                height: 123,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/images/virtualAssistant.png')),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 40).copyWith(
              top: 30,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Pallete.borderColor,

              ),
              borderRadius: BorderRadius.circular(20).copyWith(
                topLeft: Radius.zero,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text('Good Morning , what task can U do for you ?',
              style: TextStyle(
                color: Pallete.mainFontColor,
                fontSize: 25,
                fontFamily: 'Cera Pro',
              ),),
            ),

          ),

        ],
      ),
    );
  }
}