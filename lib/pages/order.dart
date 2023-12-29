import 'package:flutter/material.dart';
import 'home.dart';
import 'order.dart';

class CartPage extends StatefulWidget {
  final List<MenuItem> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                onTap: (){
                  
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
                        'Checkout',
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
}
