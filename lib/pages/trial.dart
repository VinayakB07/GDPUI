import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Map<String, List<Map<String, dynamic>>> menuItems = {};

  @override
  void initState() {
    super.initState();
    fetchMenuItemsFromFirestore();
  }

  Future<void> fetchMenuItemsFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('MenuItems').get();

      querySnapshot.docs.forEach((doc) {
        String category = doc.id;
        List<dynamic>? items = doc.get('Items');

        if (items != null && items.isNotEmpty) {
          List<Map<String, dynamic>> itemList = items.map((item) {
            return {
              'name': item['name'] ?? '',
              'image': item['image'] ?? '',
            };
          }).toList();

          setState(() {
            menuItems[category] = itemList;
          });
        }
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Widget buildMenuList(String category, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            String itemName = items[index]['name'] ?? '';
            String itemImage = items[index]['image'] ?? '';

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(itemImage),
              ),
              title: Text(itemName),
              onTap: () {
                // Handle item tap if needed
              },
            );
          },
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Items'),
      ),
      body: ListView(
        children: menuItems.keys.map((String category) {
          List<Map<String, dynamic>> items = menuItems[category] ?? [];
          return ExpansionTile(
            title: Text(category),
            children: [
              buildMenuList(category, items),
            ],
          );
        }).toList(),
      ),
    );
  }
}
