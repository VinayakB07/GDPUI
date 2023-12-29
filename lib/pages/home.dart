import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order.dart';

class MenuItem {
  final String name;
  final String image;

  MenuItem({required this.name, required this.image});
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Map<String, List<MenuItem>> menuItems = {
    'Breakfast': [
      MenuItem(name: 'Idly 2pcs',
          image: 'https://s3.ap-south-1.amazonaws.com/shopnowchat.com/Medium/MPRzocJOpYyWy_Idly2Pcs.jpg'),
      MenuItem(name: 'Vada',
          image: 'https://farm1.staticflickr.com/320/18912568232_686613c78c_o.jpg'),
      MenuItem(name: 'Kharabath',
          image: 'https://thephotowali.files.wordpress.com/2019/08/img201908161053451336713087275706865.jpg'),
      MenuItem(name: 'Kesaribath',
          image: 'https://www.ticklingpalates.com/wp-content/uploads/2022/09/rava-kesari-recipe.jpg'),
      MenuItem(name: 'Rice Bath',
          image: 'https://smithakalluraya.com/wp-content/uploads/2014/10/image.1024x1024-43.jpg'),
      MenuItem(name: 'Any Dosa\'s',
          image: 'https://www.indianhealthyrecipes.com/wp-content/uploads/2023/06/brown-rice-dosa-recipe.jpg'),
      MenuItem(name: 'Stuffed Parathas',
          image: 'https://simmertoslimmer.com/wp-content/uploads/2022/11/Onion-paratha.jpg'),
      MenuItem(name: 'Chapathi/Phulkha',
          image: 'https://www.krumpli.co.uk/wp-content/uploads/2023/05/Homemade-Indian-Chapati-02-735x735.jpg'),
      MenuItem(name: 'Plain Parathas',
          image: 'https://indianvegrecipe.com/wp-content/uploads/2019/10/paratha-recipe-2.jpg'),
      MenuItem(name: 'gravy\'s',
          image: 'https://i.ytimg.com/vi/uCDcZMygqdg/maxresdefault.jpg'),
    ],
    'Lunch': [
      MenuItem(name: 'Rice',
          image: 'https://www.vegrecipesofindia.com/wp-content/uploads/2022/06/how-to-cook-basmati-rice-2.jpg'),
      MenuItem(name: 'Sambar',
          image: 'https://www.cubesnjuliennes.com/wp-content/uploads/2021/01/South-Indian-Sambar-Recipe.jpg'),
      MenuItem(name: 'Rasam',
          image: 'https://www.myhealthybreakfast.in/images/images-drink-2022/chana-rasam.jpg'),
      MenuItem(name: 'Vegetable Curry',
          image: 'https://greenbowl2soul.com/wp-content/uploads/2021/06/Indian-vegetable-curry.jpg'),
      MenuItem(name: 'Rice Bath',
          image: 'https://smithakalluraya.com/wp-content/uploads/2014/10/image.1024x1024-43.jpg'),
      MenuItem(name: 'CurdRice',
          image: 'https://www.vegrecipesofindia.com/wp-content/uploads/2016/07/curd-rice-2-500x500.jpg'),
      MenuItem(name: 'Stuffed Parathas',
          image: 'https://simmertoslimmer.com/wp-content/uploads/2022/11/Onion-paratha.jpg'),
      MenuItem(name: 'Chapathi/Phulkha',
          image: 'https://www.krumpli.co.uk/wp-content/uploads/2023/05/Homemade-Indian-Chapati-02-735x735.jpg'),
      MenuItem(name: 'Plain Parathas',
          image: 'https://indianvegrecipe.com/wp-content/uploads/2019/10/paratha-recipe-2.jpg'),
      MenuItem(name: 'Indian gravy\'s',
          image: 'https://i.ytimg.com/vi/uCDcZMygqdg/maxresdefault.jpg'),
    ],
    'Dinner': [
      MenuItem(name: 'phulkha(3pcs) with curry',
          image: 'https://as2.ftcdn.net/v2/jpg/01/15/45/43/1000_F_115454319_6SlLY58SwqRdx4o8vqvTHA9nTJ5l6ss2.jpg'),
      MenuItem(name: 'Any RiceBath',
          image: 'https://smithakalluraya.com/wp-content/uploads/2014/10/image.1024x1024-43.jpg'),
      MenuItem(name: 'Pizza Parathas',
          image: 'https://i.ytimg.com/vi/-JKtWOqARa4/maxresdefault.jpg'),
      MenuItem(name: 'Stuffed Parathas',
          image: 'https://simmertoslimmer.com/wp-content/uploads/2022/11/Onion-paratha.jpg'),
      MenuItem(name: 'Chapathi(3pcs) with Curry',
          image: 'https://www.shutterstock.com/image-photo/vegetarian-indian-thali-home-food-600nw-1939889272.jpg'),
      MenuItem(name: 'Indian Tacos',
          image: 'https://keviniscooking.com/wp-content/uploads/2022/08/Navajo-Tacos-Indian-Fry-Bread-square-1000x1000.jpg'),
      MenuItem(name: 'Indian gravy\'s',
          image: 'https://i.ytimg.com/vi/uCDcZMygqdg/maxresdefault.jpg'),
    ],
  };

  String currentMenu = '';

  List<MenuItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    currentMenu = getMenuBasedOnTime();
  }

  String getMenuBasedOnTime() {
    var currentTime = DateTime
        .now()
        .hour;
    if (currentTime >= 5 && currentTime < 12) {
      return 'Breakfast';
    } else if (currentTime >= 12 && currentTime < 17) {
      return 'Lunch';
    } else {
      return 'Dinner';
    }
  }

  void addToCart(MenuItem item) {
    setState(() {
      cartItems.add(item);
    });
  }


  @override
  Widget build(BuildContext context) {
    List<MenuItem> items = menuItems[currentMenu] ?? [];

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Text(
                'Today\'s Menu',
                style: TextStyle(
                  fontSize: 28, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Available menu for $currentMenu:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: items.map((item) {
                    return Card(
                      elevation: 4.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(item.image),
                        ),
                        title: Text(
                          item.name,
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            if(cartItems.length>=2){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Reached Maximum Limit'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                            else{
                              addToCart(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${item.name} added to cart'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                            },
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 55,),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) => CartPage(cartItems: cartItems),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}