import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collectionGroup('orders').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No orders found'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                            for (var item in order['orderItems'])
                              Text('${item['itemName']}'),
                          ],
                        ),
                        // Add more details as needed
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _deleteAllOrders();
                  },
                  child: Text('Delete All Orders'),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void _deleteAllOrders() {
    FirebaseFirestore.instance.collectionGroup('orders').get().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }
}
