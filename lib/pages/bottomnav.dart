import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/menuselection.dart';

import 'package:food_app/pages/profile.dart';
import 'package:food_app/pages/wallet.dart';



class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late ProfilePage profile;
  late Wallet wallet;
  late MenuHome menuHome;

  @override
  void initState() {

    menuHome=MenuHome();
    profile = ProfilePage();
    wallet = Wallet();
    pages = [menuHome,wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomNavigationBar(
            currentIndex:currentTabIndex,
            onTap: (int index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: 0,
            left: MediaQuery.of(context).size.width / 11.5 +
                (MediaQuery.of(context).size.width / 3) * currentTabIndex,
            child: Container(
              width: MediaQuery.of(context).size.width / 6,
              height: 3,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: pages[currentTabIndex],
          ),
        ],
      ),
    );
  }
}




