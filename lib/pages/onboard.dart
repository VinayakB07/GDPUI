
import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/login.dart';
import 'package:get/get.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose of the timer
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    const Duration duration = Duration(seconds: 4); // Change the duration as needed
    _timer = Timer.periodic(duration, (_) {
      _changePage();
    });
  }

  void _changePage() {
    final int nextPage = (_currentIndex + 1) % tabs.length;
    _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 30, 0),
            
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
              ),
              onPressed: () {
                Get.offAll(LogIn(),transition: Transition.zoom,duration: Duration(milliseconds: 1200));

              },
              child: Text("Next", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Positioned(
            top: 0,
            right: 5,
            left: 5,
            child: Image.asset(
              tabs[_currentIndex].lottieFile,
              key: Key('${Random().nextInt(999999999)}'),
              width: 600,
              alignment: Alignment.topCenter,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 270,
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: tabs.length,
                      itemBuilder: (BuildContext context, int index) {
                        OnboardingModel tab = tabs[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 70),
                            Text(
                              tab.title,
                              style: const TextStyle(
                                fontSize: 27.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              tab.subtitle,
                              style: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      },
                      onPageChanged: (value) {
                        _currentIndex = value;
                        setState(() {});
                      },
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int index = 0; index < tabs.length; index++)
                        _DotIndicator(isSelected: index == _currentIndex),
                    ],
                  ),
SizedBox(height: 40,)
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}



class _DotIndicator extends StatelessWidget {
  final bool isSelected;

  const _DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 6.0,
        width: isSelected ?50:13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          color: isSelected ? Colors.redAccent : Colors.red[200],
        ),
      ),
    );
  }
}

class OnboardingModel {
  final String lottieFile;
  final String title;
  final String subtitle;

  OnboardingModel(this.lottieFile, this.title, this.subtitle);
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    'assets/screen1.gif',
    'Taste on Demand',
    'When you order Eat Street, \nwe\'ll hook you up with exclusive \ncoupons.',
  ),
  OnboardingModel(
    'assets/screen2.gif',
    'Simplified Satisfaction',
    'We make it simple to find the \nfood you crave. Enter your \naddress and let',
  ),
  OnboardingModel(
    'assets/screen3.gif',
    'On your fingertips',
    'We make food ordering fast, \nsimple, and free - no matter if you \norder',
  ),
];


// floatingActionButton: FloatingActionButton(
// onPressed: () {
// if (_currentIndex == 2) {
// _pageController.animateToPage(
// 0,
// duration: const Duration(milliseconds: 300),
// curve: Curves.linear,
// );
// } else {
// _pageController.nextPage(
// duration: const Duration(milliseconds: 300),
// curve: Curves.linear,
// );
// }
// },
// child: const Icon(CupertinoIcons.chevron_right, color: Colors.white),
// backgroundColor: Colors.transparent,
// ),

