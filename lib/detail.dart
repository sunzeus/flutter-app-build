import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Import audioplayers package
import 'package:flutter/widgets.dart';
import 'package:namer_app/config/Routes.dart' as Routing;

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}
  // Initialize AudioPlayer

class _DetailScreenState extends State<DetailScreen> {
  
  int _currentImageIndex = 0;
  String _currentImage ='';
  String _music = '';
  String _musicCharacter = '';

  int _currentImageIndex_1 = 0;
  String _currentImage_1 ='';
  String _music_1 = '';
  String _musicCharacter_1 = '';
  bool flag = false;
  // AudioPlayer _audioPlayer = AudioPlayer(); // Initialize AudioPlayer
   late AudioPlayer player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    // _playCharacterMusic(); // Play default music when the widget is first built
    // _audioPlayer = AudioPlayer();
    // _playCharacterMusic(); 
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource(_musicCharacter_1));
      await player.resume();
    }); 
  }

  void _nextImage(int imageIndex) {
    setState(() {
      if(!flag){
        _currentImageIndex = imageIndex;
        flag = true;  
      }
      _currentImageIndex =
          (_currentImageIndex + 1) % Routing.Character_link.length;
      _currentImage = Routing.Character_link[_currentImageIndex];
      _musicCharacter = Routing.AudioCharacter[(_musicCharacter=="")?_currentImageIndex_1:_currentImageIndex];
      _playCharacterMusic();
      
    });
  }

  void _previousImage(int imageIndex) {
    setState(() {
      if(!flag){
        _currentImageIndex = imageIndex;
        flag = true;
      }
      _currentImageIndex =
          (_currentImageIndex - 1 + Routing.Character_link.length) %
              Routing.Character_link.length;
      _currentImage = Routing.Character_link[_currentImageIndex];
      _musicCharacter = Routing.AudioCharacter[_currentImageIndex];
      
      _playCharacterMusic();
    });
  }



void _playCharacterMusic() async {
    
      await player.setSource(AssetSource(_musicCharacter));
    // await player.setAsset(_musicCharacter);
    await player.resume();
    
    print(_musicCharacter);
  }   

void _playMusic() async {
     
      await player.setSource(AssetSource(_music));
    // await player.setAsset(_musicCharacter);
    await player.resume();
    print(_music);
  }    


    
  @override
Widget build(BuildContext context) {
  
  final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

  if (args != null) {
    _currentImageIndex_1 = args['index'] as int;
    _currentImage_1 = args['characterLink'] as String;

    _musicCharacter_1 = args['audioCharacter'] as String;
  }

  // _playCharacterMusic();

  return Scaffold(
    body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                
                Routing.Background[(_currentImage=="")?_currentImageIndex_1:_currentImageIndex],
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(330.0, 20.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/images/icon/home.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
                      child: Center(
                        
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                           
                              _currentImageIndex = ((_currentImage=="")?_currentImageIndex_1:_currentImageIndex) % Routing.CharacterChange_link.length;
                              _currentImage = Routing.CharacterChange_link[_currentImageIndex];
                              _music = Routing.AudioFace[_currentImageIndex];
                              
                              _playMusic(); // Call function to play music
                            });
                          },
                          child: Image.asset(
                            
                            (_currentImage=="")?_currentImage_1:_currentImage,
                            width: 600.0,
                          ),
                        ),
                        // child: _renderFunction(),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(105.0, 0.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _previousImage(_currentImageIndex_1);
                        },
                        child: Image.asset('assets/images/icon/back.png', width: 100.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          _nextImage(_currentImageIndex_1);  
                        },
                        child: Image.asset('assets/images/icon/next.png', width: 100.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}