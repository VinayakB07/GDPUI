import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/profile.dart';
import 'package:food_app/pages/wallet.dart';

import 'home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late MenuPage homepage;
  late Profile profile;
  late Wallet wallet;

  @override
  void initState() {
    homepage = MenuPage();
    profile = Profile();
    wallet = Wallet();
    pages = [homepage, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: CurvedNavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,
            color: Colors.deepOrange,
            buttonBackgroundColor: Colors.orange,
            animationDuration: Duration(milliseconds: 500),
            animationCurve: Curves.easeInOut,
            index: currentTabIndex,
            onTap: (int index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            items: [
              Icon(
                Icons.restaurant_menu,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.account_balance_wallet,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
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




