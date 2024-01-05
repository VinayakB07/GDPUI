import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/bottomnav.dart';
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
String formattedDate = DateFormat('yyyy-MM-dd HH:mm ').format(now);
Future<void> placeOrderToFirebase(UserDetails userDetails,List<MenuItem> cartitems) async {
  CollectionReference userOrders = FirebaseFirestore.instance.collection('users/${userDetails.userId}/orders');
  AuthService authService = AuthService();
  User? currentUser = await authService.getCurrentUser();
  DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
      .collection('UserDetail')
      .doc(currentUser!.uid)
      .get();

  Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

  String? phoneNumber;

  if (userData != null && userData['phoneNumber'] != null) {
    phoneNumber = userData['phoneNumber'] as String?;
  }
  await userOrders.add({
    'userDetails': {
      'orderId':userDetails.userId,
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
    'phone':phoneNumber,
    // Additional order information can be added here
  });
}
class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Cart",style: TextStyle(
         fontSize: 24
       ),),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(blurRadius: 1.3)]),
                      child: Row(

                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: NetworkImage(item.image),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                                Icon(Icons.check,color: Colors.redAccent,),

                              ],
                            ),
                          ),
                          SizedBox(width: 20,)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                backgroundColor: Colors.redAccent
              ),
              onPressed: () async {
    UserDetails userDetails = await createUsserDetail();
    if (userDetails != null && widget.cartItems.isNotEmpty) {
    await placeOrderToFirebase(userDetails, widget.cartItems);
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
            'Order Placed'),
        duration: Duration(seconds: 2),
      ),
    );
    _clearCart();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
              'No items in cart'),
          duration: Duration(seconds: 2),
        ),
      );
    }},
              child: Text("Place Order",style: TextStyle(
                color: Colors.white
              ),),
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }


  void _clearCart() {
    setState(() {
      widget.cartItems.clear();
    });
  }
}

