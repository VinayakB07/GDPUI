import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../service/auth.dart';

import 'package:intl/intl.dart';

import 'new_menu.dart';


class CartPage extends StatefulWidget {
  late final List<MenuItem> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}
class UserDetails {
  final String userId;
  final String? name;
  final String? email;

  UserDetails({
    required this.userId,
    required this.name,
    required this.email,
  });
}

Future<UserDetails> createUsserDetail() async{
  AuthService authService = AuthService();
  User? currentUser = await authService.getCurrentUser();
  UserDetails userDetails=UserDetails(userId: currentUser!.uid, name: currentUser?.displayName, email: currentUser?.email);
  return userDetails;
}
DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
Future<void> placeOrderToFirebase(UserDetails userDetails,List<MenuItem> cartitems) async {
  CollectionReference userOrders = FirebaseFirestore.instance.collection('users/${userDetails.userId}/orders');

  await userOrders.add({
    'userDetails': {
      'name': userDetails.name,
      'email': userDetails.email,
      // Add other user details here
    },
    'orderItems': cartitems.map((item) => {
      'itemName': item.name,
      'image': item.image,
      // Add other order item details here
    }).toList(),
    'timestamp': formattedDate,
    // Additional order information can be added here
  });
}
class _CartPageState extends State<CartPage> {
  void _showOrderPlacedSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order placed'),
        duration: Duration(seconds: 2),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            'Cart',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.orange, Colors.deepOrange],
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
            Expanded(
              child: widget.cartItems.isEmpty
                  ? Center(
                child: Text('Cart is empty'),
              )
                  : ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  MenuItem item = widget.cartItems[index];
                  return Dismissible(
                    key: Key(item.name),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _removeFromCart(index);
                    },
                    background: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Card(
                      elevation: 4.0,
                      margin: EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(item.image),
                        ),
                        title: Text(item.name),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _removeFromCart(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
              child: GestureDetector(
                onTap: () async {
                  UserDetails userDetails = await createUsserDetail();
                  if (userDetails != null) {
                    await placeOrderToFirebase(userDetails, widget.cartItems);
                    _showOrderPlacedSnackBar();
                    _clearCart();
                  } else {
                    print("User not defined");
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child:  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.deepOrange],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                      ),
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 20, // Adjust the font size as needed
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removeFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item removed from cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }
  void _clearCart() {
    setState(() {
      widget.cartItems.clear();
    });
  }
}

