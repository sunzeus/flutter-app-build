import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:namer_app/config/Routes.dart' as Routing;

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int _currentImageIndex = 0; // Initial index of the current image
  bool _isLoading = false; // Track whether loading is in progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back/IMG_0073.PNG"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the desired page
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: GridView.builder(
                      itemCount: Routing.Character_link.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two images per row
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 0.0,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (!_isLoading) {
                              setState(() {
                                _isLoading = true; // Set loading to true
                              });
                              // Simulate loading delay
                              Future.delayed(Duration(seconds: 1), () {
                                // Navigate after 2 seconds
                                Navigator.pushNamed(
                                  context, 
                                  '/detail',
                                  arguments: {
                                    'index': index,
                                    'characterLink': Routing.Character_link[index],
                                    'audioCharacter': Routing.AudioCharacter[index],
                                  },
                                );
                                // Reset isLoading after navigation
                                setState(() {
                                  _isLoading = false;
                                });
                              });
                            }
                          },
                          child:SizedBox(
                            width: 50.0,
                            child: Image.asset(
                            Routing.Character_link[index],
                            
                            ),
                          )
                           
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Loading Indicator
          if (_isLoading)
            Container(
              color: Color.fromARGB(255, 183, 220, 250).withOpacity(0.8), // Semi-transparent black color
              child: Center(
                child:Column(
                  children: [
                    GestureDetector(
                      child:Padding(
                        padding: EdgeInsets.only(top: 300),
                        
                        
                      child: Container(
                        width: 300.0, 
                        // Set width to control the size of the progress bar
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0), // Adjust border radius as needed
                          border: Border.all(
                            color: Color.fromRGBO(125, 79, 58, 1), // Set border color
                            width: 8.0, // Set border width
                            
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 184, 92), // Change these colors as per your preference
                              Color.fromARGB(255, 255, 75, 4),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,

                            
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0), // Adjust border radius as needed
                            border: Border.all(
                              color: Colors.white, // Set inner border color
                              width: 3.0, // Set inner border width
                            ),
                            
                          ),
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(50.0), 
                            minHeight: 30, // Set minimum height of the progress bar
                            backgroundColor: Colors.transparent, // Background color of the progress bar
                            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 101, 238, 10)), // Color of the progress bar
                          ),
                        ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child:Padding(
                        padding: EdgeInsets.only(top: 100),
                      child: Image.asset("assets/images/back/IMG_0106.PNG")
                      )
                    )
                  ],
                  )
                 
              ),
            ),
        ],
      ),
    );
  }
}