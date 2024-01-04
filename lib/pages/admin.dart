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
        title: Text('Admin Orders'),
        actions: [
          TextButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
            label: Text(""),
          ),
    TextButton.icon(
    onPressed: () {
    _deleteAllOrders();
    },
    icon: Icon(Icons.delete),
     label: Text(""),
    )
        ],
      ),
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

                if (order == null) {
                  return SizedBox(); // or any widget you prefer for handling null data
                }

                // Render your order details here
                return ListTile(
                  title: Text(order['userDetails']['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order time: ${order['timestamp']}'),
                      Text("Ordered Items:"),
                      for (var item in order['orderItems']) Text('${item['itemName']}'),
                    ],
                  ),
                  // Add more details as needed
                );
              },
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Filter Orders'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Today'),
              onTap: () {
                setState(() {
                  _selectedDate = DateTime.now();
                  _ordersStream = getFilteredOrdersStream(_selectedDate);
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Last 7 days'),
              onTap: () {
                setState(() {
                  _selectedDate = DateTime.now().subtract(Duration(days: 7));
                  _ordersStream = getFilteredOrdersStream(_selectedDate);
                  print('Selected Date: $_selectedDate');
                });
                Navigator.pop(context);
              },
            ),
            // Other filter options...
            ListTile(
              title: Text('Clear Filter'),
              onTap: () {
                setState(() {
                  _selectedDate = null;
                  _ordersStream = getFilteredOrdersStream(_selectedDate);
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
void _deleteAllOrders() {
  // Access your Firestore collection and delete all documents
  FirebaseFirestore.instance.collection('orders').get().then((snapshot) {
    for (DocumentSnapshot doc in snapshot.docs) {
      doc.reference.delete();
    }
  });
}