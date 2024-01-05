import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'order.dart';

class MenuItem {
  final String name;
  final String image;
   int quantity;
  MenuItem({required this.name, required this.image,this.quantity=0});
}

class Menupage extends StatefulWidget {
  final String selectedMenu;
  final String headImage;

  Menupage({required this.selectedMenu, required this.headImage});

  @override
  _MenupageState createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  Map<String, List<MenuItem>> menuItems = {
    'Breakfast': [
      MenuItem(
          name: 'Idly 2pcs',
          image:
              'https://s3.ap-south-1.amazonaws.com/shopnowchat.com/Medium/MPRzocJOpYyWy_Idly2Pcs.jpg'),
      MenuItem(
          name: 'Vada',
          image:
              'https://farm1.staticflickr.com/320/18912568232_686613c78c_o.jpg'),
      MenuItem(
          name: 'Kharabath',
          image:
              'https://thephotowali.files.wordpress.com/2019/08/img201908161053451336713087275706865.jpg'),
      MenuItem(
          name: 'Kesaribath',
          image:
              'https://www.ticklingpalates.com/wp-content/uploads/2022/09/rava-kesari-recipe.jpg'),
      MenuItem(
          name: 'Rice Bath',
          image:
              'https://smithakalluraya.com/wp-content/uploads/2014/10/image.1024x1024-43.jpg'),
      MenuItem(
          name: 'Any Dosa\'s',
          image:
              'https://www.indianhealthyrecipes.com/wp-content/uploads/2023/06/brown-rice-dosa-recipe.jpg'),
      MenuItem(
          name: 'Stuffed Parathas',
          image:
              'https://simmertoslimmer.com/wp-content/uploads/2022/11/Onion-paratha.jpg'),
      MenuItem(
          name: 'Chapathi/Phulkha',
          image:
              'https://www.krumpli.co.uk/wp-content/uploads/2023/05/Homemade-Indian-Chapati-02-735x735.jpg'),
      MenuItem(
          name: 'Plain Parathas',
          image:
              'https://indianvegrecipe.com/wp-content/uploads/2019/10/paratha-recipe-2.jpg'),
      MenuItem(
          name: 'gravy\'s',
          image: 'https://i.ytimg.com/vi/uCDcZMygqdg/maxresdefault.jpg'),
    ],
    'Lunch': [
      MenuItem(
          name: 'Rice',
          image:
              'https://www.vegrecipesofindia.com/wp-content/uploads/2022/06/how-to-cook-basmati-rice-2.jpg'),
      MenuItem(
          name: 'Sambar',
          image:
              'https://www.cubesnjuliennes.com/wp-content/uploads/2021/01/South-Indian-Sambar-Recipe.jpg'),
      MenuItem(
          name: 'Rasam',
          image:
              'https://www.myhealthybreakfast.in/images/images-drink-2022/chana-rasam.jpg'),
      MenuItem(
          name: 'Vegetable Curry',
          image:
              'https://greenbowl2soul.com/wp-content/uploads/2021/06/Indian-vegetable-curry.jpg'),
      MenuItem(
          name: 'Rice Bath',
          image:
              'https://smithakalluraya.com/wp-content/uploads/2014/10/image.1024x1024-43.jpg'),
      MenuItem(
          name: 'CurdRice',
          image:
              'https://www.vegrecipesofindia.com/wp-content/uploads/2016/07/curd-rice-2-500x500.jpg'),
      MenuItem(
          name: 'Stuffed Parathas',
          image:
              'https://simmertoslimmer.com/wp-content/uploads/2022/11/Onion-paratha.jpg'),
      MenuItem(
          name: 'Chapathi/Phulkha',
          image:
              'https://www.krumpli.co.uk/wp-content/uploads/2023/05/Homemade-Indian-Chapati-02-735x735.jpg'),
      MenuItem(
          name: 'Plain Parathas',
          image:
              'https://indianvegrecipe.com/wp-content/uploads/2019/10/paratha-recipe-2.jpg'),
      MenuItem(
          name: 'Indian gravy\'s',
          image: 'https://i.ytimg.com/vi/uCDcZMygqdg/maxresdefault.jpg'),
    ],
    'Dinner': [
      MenuItem(
          name: 'phulkha(3pcs)\nwith curry',
          image:
              'https://as2.ftcdn.net/v2/jpg/01/15/45/43/1000_F_115454319_6SlLY58SwqRdx4o8vqvTHA9nTJ5l6ss2.jpg'),
      MenuItem(
          name: 'Any RiceBath',
          image:
              'https://smithakalluraya.com/wp-content/uploads/2014/10/image.1024x1024-43.jpg'),
      MenuItem(
          name: 'Pizza Parathas',
          image: 'https://i.ytimg.com/vi/-JKtWOqARa4/maxresdefault.jpg'),
      MenuItem(
          name: 'Stuffed Parathas',
          image:
              'https://simmertoslimmer.com/wp-content/uploads/2022/11/Onion-paratha.jpg'),
      MenuItem(
          name: 'Chapathi(3pcs)\nwith Curry',
          image:
              'https://www.shutterstock.com/image-photo/vegetarian-indian-thali-home-food-600nw-1939889272.jpg'),
      MenuItem(
          name: 'Indian Tacos',
          image:
              'https://keviniscooking.com/wp-content/uploads/2022/08/Navajo-Tacos-Indian-Fry-Bread-square-1000x1000.jpg'),
      MenuItem(
          name: 'Indian gravy\'s',
          image: 'https://i.ytimg.com/vi/uCDcZMygqdg/maxresdefault.jpg'),
    ],
    'All Menu': [
      MenuItem(
          name: 'Rice',
          image:
              'https://www.vegrecipesofindia.com/wp-content/uploads/2022/06/how-to-cook-basmati-rice-2.jpg'),
      MenuItem(
          name: 'Sambar',
          image:
              'https://www.cubesnjuliennes.com/wp-content/uploads/2021/01/South-Indian-Sambar-Recipe.jpg'),
      MenuItem(
          name: 'Rasam',
          image:
              'https://www.myhealthybreakfast.in/images/images-drink-2022/chana-rasam.jpg'),
      MenuItem(
          name: 'Vegetable Curry',
          image:
              'https://greenbowl2soul.com/wp-content/uploads/2021/06/Indian-vegetable-curry.jpg'),
      MenuItem(
          name: 'CurdRice',
          image:
              'https://www.vegrecipesofindia.com/wp-content/uploads/2016/07/curd-rice-2-500x500.jpg'),
      MenuItem(
          name: 'Plain Parathas',
          image:
              'https://indianvegrecipe.com/wp-content/uploads/2019/10/paratha-recipe-2.jpg'),
      MenuItem(
          name: 'phulkha(3pcs)\nwith curry',
          image:
              'https://as2.ftcdn.net/v2/jpg/01/15/45/43/1000_F_115454319_6SlLY58SwqRdx4o8vqvTHA9nTJ5l6ss2.jpg'),
      MenuItem(
          name: 'Any RiceBath',
          image:
              'https://smithakalluraya.com/wp-content/uploads/2014/10/image.1024x1024-43.jpg'),
      MenuItem(
          name: 'Pizza Parathas',
          image: 'https://i.ytimg.com/vi/-JKtWOqARa4/maxresdefault.jpg'),
      MenuItem(
          name: 'Stuffed Parathas',
          image:
              'https://simmertoslimmer.com/wp-content/uploads/2022/11/Onion-paratha.jpg'),
      MenuItem(
          name: 'Chapathi(3pcs)\nwith Curry',
          image:
              'https://www.shutterstock.com/image-photo/vegetarian-indian-thali-home-food-600nw-1939889272.jpg'),
      MenuItem(
          name: 'Indian Tacos',
          image:
              'https://keviniscooking.com/wp-content/uploads/2022/08/Navajo-Tacos-Indian-Fry-Bread-square-1000x1000.jpg'),
      MenuItem(
          name: 'Indian gravy\'s',
          image: 'https://i.ytimg.com/vi/uCDcZMygqdg/maxresdefault.jpg'),
      MenuItem(
          name: 'Idly 2pcs',
          image:
              'https://s3.ap-south-1.amazonaws.com/shopnowchat.com/Medium/MPRzocJOpYyWy_Idly2Pcs.jpg'),
      MenuItem(
          name: 'Vada',
          image:
              'https://farm1.staticflickr.com/320/18912568232_686613c78c_o.jpg'),
      MenuItem(
          name: 'Kharabath',
          image:
              'https://thephotowali.files.wordpress.com/2019/08/img201908161053451336713087275706865.jpg'),
      MenuItem(
          name: 'Kesaribath',
          image:
              'https://www.ticklingpalates.com/wp-content/uploads/2022/09/rava-kesari-recipe.jpg'),
      MenuItem(
          name: 'Any Dosa\'s',
          image:
              'https://www.indianhealthyrecipes.com/wp-content/uploads/2023/06/brown-rice-dosa-recipe.jpg'),
      MenuItem(
          name: 'Stuffed Parathas',
          image:
              'https://simmertoslimmer.com/wp-content/uploads/2022/11/Onion-paratha.jpg'),
    ],
  };

  String currentMenu = ''; // Store the currently selected menu
  List<MenuItem> items = []; // Initialize the items list
  List<MenuItem> cartItems = [];
  int quantity = 0;
  @override
  void initState() {
    super.initState();
    // Update currentMenu and items based on the selectedMenu from the widget
    currentMenu = widget.selectedMenu;
    items =
        menuItems[currentMenu] ?? []; // Populate items based on the currentMenu
  }

  void addToCart(MenuItem carti) {
    setState(() {
      carti.quantity++;
      cartItems.add(carti);
    });
  }
  void removeFromCart(MenuItem carti) {
    setState(() {
      carti.quantity--;
      cartItems.remove(carti);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MenuItem> items = menuItems[currentMenu] ?? [];

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(cartItems: cartItems)));
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.redAccent,
            ),
            label: Text(""),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle your back button functionality here
            Navigator.of(context).pop();
          },
        ),
        title: Text("Back"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.headImage),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Center(
                child: Text(
                  widget.selectedMenu,
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    height: 0.03,
                    letterSpacing: 0.02,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.redAccent,
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "EXPLORE",
                    style: TextStyle(fontSize: 15, letterSpacing: 1.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.redAccent,
                  )),
                ]),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: items.map((item) {
                    return Column(
                      children: [
                        Container(
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
                                    Container(
                                      height: 28,
                                      padding: EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.red[100],
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10)
                                                ),
                                                boxShadow: [BoxShadow(blurRadius: 1)]
                                            ),
                                            child: IconButton(
                                                onPressed: () {
                                                  if (cartItems.length == 0) {
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                            'No item to delete'),
                                                        duration: Duration(seconds: 2),
                                                      ),
                                                    );
                                                  } else {
                                                    removeFromCart(item);
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                            '${item.name} removed from cart'),
                                                        duration: Duration(seconds: 2),
                                                      ),
                                                    );
                                                  }
                                                },
                                                icon: Icon(Icons.remove),
                                                iconSize: 15),
                                          ),
                                          Container(

                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                            boxShadow: [BoxShadow(blurRadius: 1)]
                                            ),
                                            height: 28,
                                            width: 20,
                                            child: Center(child: Text("${item.quantity}")),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight: Radius.circular(10)

                                              ),
                                                boxShadow: [BoxShadow(blurRadius: 1)]
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                if (cartItems.length >= 2) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Reached Maximum Limit'),
                                                      duration: Duration(seconds: 2),
                                                    ),
                                                  );
                                                } else {
                                                  addToCart(item);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          '${item.name} added to cart'),
                                                      duration: Duration(seconds: 2),
                                                    ),
                                                  );
                                                }
                                              },
                                              icon: Icon(Icons.add),
                                              iconSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10,)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
