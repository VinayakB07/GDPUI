import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage("images/Wallet.png")),

        Text("Coming Soon!",style: TextStyle(
          fontSize: 20,
          color:Colors.redAccent,
          fontWeight: FontWeight.w700
        ),)
      ],
    );
  }
}
