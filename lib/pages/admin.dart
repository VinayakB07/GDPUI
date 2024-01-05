import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminOrdersScreen extends StatefulWidget {
  @override
  _AdminOrdersScreenState createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> {
  DateTime? _selectedDate;
  late Stream<QuerySnapshot> _ordersStream;

  Stream<QuerySnapshot> getFilteredOrdersStream(DateTime? selectedDate) {
    if (selectedDate == null) {
      return FirebaseFirestore.instance.collectionGroup('orders').snapshots();
    } else {
      Timestamp selectedTimestamp = Timestamp.fromDate(selectedDate);

      return FirebaseFirestore.instance
          .collectionGroup('orders')
          .where('timestamp', isGreaterThanOrEqualTo: selectedTimestamp)
          .snapshots();
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the initial stream
    _ordersStream = getFilteredOrdersStream(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        actions: [
          TextButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout,color: Colors.redAccent,),
            label: Text(""),
          ),

        ],
      ),
      backgroundColor: Colors.grey[200],
      body: StreamBuilder<QuerySnapshot>(
        stream: _ordersStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No orders found'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic>? order =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>?;
                 String formattedDateTime=order?['timestamp'];
                List<String> dateTimeParts = formattedDateTime.split(' ');
                String date = dateTimeParts[0]; // Extract date part
                String time = dateTimeParts[1];
                if (order == null) {
                  return SizedBox(); // or any widget you prefer for handling null data
                }

                // Render your order details here
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        blurRadius: 2,
                      )],
                      borderRadius: BorderRadius.circular(5)
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: [
                                Text("Name : ",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                                ),),
                                Text(order['userDetails']['name'])
                              ],
                            ),
                            Row(
                              children: [
                                Text("Phone : ",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500
                                ),),
                                Text(order['phone'])
                              ],
                            ),
                            Text("Item Ordered :",style: TextStyle(
                                fontSize: 15 ,
                                fontWeight: FontWeight.w500
                            ),),
                            for (var item in order['orderItems'])
                             Text('${item['itemName']}'),

                          ],
                        ),
                        Container(
                          height: 105,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text("Order ID : ",style: TextStyle(
                              fontWeight: FontWeight.w500
                          ),),
                                  Text("${(order['userDetails']['orderId'] as String).toUpperCase().substring(0, min(6, (order['userDetails']['orderId'] as String).length))}",style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  ),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Time&date : "),
                                  Text(time),
                                ],
                              ),
                              Text(date),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Add more details as needed
                  ),
                );
              },
            );
          }
        },
      ),

    );
  }
}

