import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_chat/features_box.dart';
import 'package:voice_chat/openai_services.dart';
import 'package:voice_chat/pallette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final flutterTts = FlutterTts();
  final speechToText = SpeechToText();
  String? generateContent;
  String? generateImageUrl;
  String lastWords = '';
  bool _speechEnabled = false;
 final OpenAIService openAIService =OpenAIService();
  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  
  }
  Future<void>initTextToSpeech()async{

await flutterTts.setSharedInstance(true);
setState(() {
  
});
  }

  Future<void> initSpeechToText() async {
    _speechEnabled = await speechToText.initialize(
      onStatus: (status) => print('Speech status: $status'),
      onError: (error) => print('Speech error: $error'),
    );
    setState(() {});
  }

  Future<void> startListening() async {
    if (_speechEnabled) {
      await speechToText.listen(onResult: onSpeechResult);
      setState(() {});
    } else {
      print('Speech recognition not enabled.');
    }
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
    print('Recognized words: $lastWords');
  }
  Future<void> systemSpeak(String content)async{
    await flutterTts.speak(content);
  }
 

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yassmina'),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: const BoxDecoration(
                      color: Pallete.assistantCircleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  height: 123,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/virtualAssistant.png'),
                    ),
                  ),
                ),
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
                ),
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                generateContent ==null  ? 
                'Good Morning , what task can U do for you ?':
                generateContent!,
                  style: TextStyle(
                    color: Pallete.mainFontColor,
                    fontSize: generateContent ==null  ?  25 :18,
                    fontFamily: 'Cera Pro',
                  ),
                ),
              ),
            ),
            Visibility(
              visible: generateContent==null,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, left: 22),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Here are few features",
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.mainFontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
              Visibility(
                visible:  generateContent==null,

               child: Column(
                children: [
                  FeatureBox(
                    color: Pallete.firstSuggestionBoxColor,
                    headerText: 'ChatGPT',
                    description:
                        'A smarter way to stay organized and informed with chatGPT',
                  ),
                  FeatureBox(
                    color: Pallete.secondSuggestionBoxColor,
                    headerText: 'Dall-E',
                    description:
                        'Get inspired and stay creative with your personal assistant powered by Dall-E',
                  ),
                  FeatureBox(
                    color: Pallete.thirdSuggestionBoxColor,
                    headerText: 'Smart Voice Assistant ',
                    description:
                        'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                  ),
                ],
                           ),
             )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            
         final speech =  await  openAIService.isArtPromptAPI(lastWords);
         if(speech.contains('https')){
          generateImageUrl = speech;
          generateContent = null;
         }
         else{
          generateImageUrl = null;
          generateContent = speech;
          setState(() {
            
          });
            await systemSpeak(speech);
         }
       
            await stopListening();
          } else {
          
            initSpeechToText();
          }
        },
        child: Icon(
          speechToText.isListening ? Icons.stop : Icons.mic,
        ),
      ),
    );
  }
}
