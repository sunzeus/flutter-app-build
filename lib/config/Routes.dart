// import 'package:namer_app/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:namer_app/detail.dart';
import 'package:namer_app/list.dart';
import 'package:namer_app/other.dart';
// import 'package:namer_app/signup/signup.dart';


//Routes
// const String HOME = '/';
// const String LOGIN = '/login';
const String DETAIL = '/detail';
const String LIST = '/list';
const String OTHER = '/other';

const Route_urls = ['/detail' ,'/list','/other'];

const Routes = ['Detail','/list','/other' ];

const Character_link = [
    'assets/images/character/IMG_9209.png',
    'assets/images/character/IMG_9211.png',
    'assets/images/character/IMG_9213.png',
    'assets/images/character/IMG_9215.png',
    'assets/images/character/IMG_9217.png',
    'assets/images/character/IMG_9219.png',
    'assets/images/character/IMG_9221.png',
    'assets/images/character/IMG_9224.png',
    'assets/images/character/IMG_9302.png',
    'assets/images/character/IMG_9305.png',
    'assets/images/character/IMG_9307.png',
    'assets/images/character/IMG_9309.png',
    'assets/images/character/IMG_9311.png',
    'assets/images/character/IMG_9313.png',
    'assets/images/character/IMG_9315.png',
    'assets/images/character/IMG_9318.png',
    ];
const CharacterChange_link = [
    'assets/images/character/IMG_9210.png',
    'assets/images/character/IMG_9212.png',
    'assets/images/character/IMG_9214.png',
    'assets/images/character/IMG_9216.png',
    'assets/images/character/IMG_9218.png',
    'assets/images/character/IMG_9226.png',
    'assets/images/character/IMG_9222.png',
    'assets/images/character/IMG_9225.png',
    'assets/images/character/IMG_9303.png',
    'assets/images/character/IMG_9304.png',
    'assets/images/character/IMG_9306.png',
    'assets/images/character/IMG_9308.png',
    'assets/images/character/IMG_9310.png',
    'assets/images/character/IMG_9312.png',
    'assets/images/character/IMG_9314.png',
    'assets/images/character/IMG_9317.png',

];
const Background =[
  "assets/images/back/IMG_0084.PNG",
  "assets/images/back/IMG_0097.PNG",
  "assets/images/back/IMG_0103.PNG",
  "assets/images/back/IMG_0090.PNG",
  "assets/images/back/IMG_0104.PNG",
  "assets/images/back/IMG_0092.PNG",
  "assets/images/back/IMG_0094.PNG",
  "assets/images/back/IMG_0100.PNG",
  "assets/images/back/IMG_0086.PNG",
  "assets/images/back/IMG_0085.PNG",
  "assets/images/back/IMG_0091.PNG",
  "assets/images/back/IMG_0087.PNG",
  "assets/images/back/IMG_0088.PNG",
  "assets/images/back/IMG_0095.PNG",
  "assets/images/back/IMG_0089.PNG",
  "assets/images/back/IMG_0093.PNG",


];
const AudioCharacter = [
 'audios/character/elephant 1.mp3',
 'audios/character/panda 1.mp3',
 'audios/character/Bear 1.mp3',
 'audios/character/Dog 1.mp3',
 'audios/character/Rabbit 1.mp3',
 'audios/character/cat 1.mp3',
 'audios/character/giraffe 1.mp3',
 'audios/character/Bat 1.mp3',
 'audios/character/frog 1.mp3',
 'audios/character/penguin 1.mp3',
 'audios/character/Lion 1.mp3',
 'audios/character/seal 1.mp3',
 'audios/character/Monkey 1.mp3',
 'audios/character/pigeon 1.mp3',
 'audios/character/Tiger 1.mp3',
 'audios/character/owl 1.mp3',
];


const AudioFace = [
 'audios/face/elephant 2.mp3',
 'audios/face/panda 2.mp3',
 'audios/face/Bear 2.mp3',
 'audios/face/Dog 2.mp3',
 'audios/face/Rabbit 2.mp3',
 'audios/face/cat 2.mp3',
 'audios/face/giraffe 2.mp3',
 'audios/face/Bat 2.mp3',
 'audios/face/frog 2.mp3',
 'audios/face/penguin 2.mp3',
 'audios/face/Lion 2.mp3',
 'audios/face/seal 2.mp3',
 'audios/face/Monkey 2.mp3',
 'audios/face/pigeon 2.mp3',
 'audios/face/Tiger 2.mp3',
 'audios/face/owl 2.mp3',
];
Widget makeRoute({required BuildContext context, required String routeName}) {
  final Widget child = _buildRoute(context: context, routeName: routeName);
  return child;
}

Widget _buildRoute({required BuildContext context, required String routeName}) {
  switch (routeName) {
    case DETAIL:
      return DetailScreen();
    case LIST:
      return  ListScreen();
    // case SIGNUP:
    //   return const SignupScreen();
    default:
      return DetailScreen();
  }
}

class ScreenArguments {
  final String identifier;
  final String title;
  final String content;

  ScreenArguments(
      {required this.identifier, required this.title, required this.content});
}
