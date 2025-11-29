import 'package:chatapp/contactscreen.dart';
import 'package:flutter/material.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({Key? key}) : super(key: key);

  @override
  _OnboardingscreenState createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  List onboardingimages = [
    {
      'image': 'assets/images/onboarding.png',
      'title': 'Welcome to Chat app',
      'description': 'Welcome to the chat app , very good and best chat app',
    },
    {
      'image': 'assets/images/onboarding.png',
      'title': 'Welcome to Chat app',
      'description': 'Welcome to the chat app , very good and best chat app',
    },
    {
      'image': 'assets/images/onboarding.png',
      'title': 'Welcome to Chat app',
      'description': 'Welcome to the chat app , very good and best chat app',
    },
  ];
  int currentpageindex = 0;
  Color whiteColor = Colors.white;
  Color transparentColor = Colors.transparent;
  Color otherColor = Colors.blue;
  PageController pageController = PageController();
  continueMethod() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contactscreen()),
              );
            },
            child: Text('Skip', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onboardingimages.length,
            onPageChanged: (index) {
              setState(() {
                currentpageindex = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(onboardingimages[index]['image']),
                  Text(
                    onboardingimages[index]['title'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    onboardingimages[index]['description'],
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                (currentpageindex == (onboardingimages.length - 1))
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          side: BorderSide.none,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Contactscreen(),
                            ),
                          );
                        },
                        child: Text('Continue'),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(onboardingimages.length, (
                          index,
                        ) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: 10,
                            width: (index == currentpageindex) ? 30 : 10,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == currentpageindex)
                                  ? Colors.orange
                                  : Colors.black,
                            ),
                          );
                        }),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
