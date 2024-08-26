import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voice_chat/features_box.dart';
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
        title: const Text('Allen'),
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
                  margin: const EdgeInsets.only(top: 4),
                  decoration: const BoxDecoration(
                    color: Pallete.assistantCircleColor,
                    shape: BoxShape.circle
                  ),
                ),
              ),
              Container(
                height: 123,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/images/virtualAssistant.png')),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
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
            child: const Padding(
              padding: EdgeInsets.symmetric(
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
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10, left: 22),
            alignment: Alignment.centerLeft,
            child: const Text("Here are few features", style: TextStyle(
              fontFamily: 'Cera Pro',
              color: Pallete.mainFontColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            
            
            ),),
          ),
          //feature  List
          const Column(
            children: [
              FeatureBox(
                color: Pallete.firstSuggestionBoxColor,
                 headerText: 'ChatGPT', 
                 description: 'A smarter way to stay organized and informed with chatGPT',),
                  FeatureBox(
                color: Pallete.secondSuggestionBoxColor,
                 headerText: 'Dall-E', 
                 description: 'Get inspired and stay creative with your personal assistant powered by Dall-E',),
                  FeatureBox(
                color: Pallete.thirdSuggestionBoxColor,
                 headerText: 'Smart Voice Assistant ', 
                 description: 'Get the best of both worlds with a voice assitant powered by Dall-E and ChatGPT',),
            ],
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: (){},
        child: const Icon(Icons.mic),
      ),
    );
  }
}