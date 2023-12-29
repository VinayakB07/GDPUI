import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 45.0,left: 20.0, right: 20.0),
                        height: MediaQuery.of(context).size.height/4.3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.elliptical(MediaQuery.of(context).size.width, 105.0),
                            )
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/6.5),
                          child: Material(
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(60),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.network("https://wallpaperaccess.com/full/8185483.jpg",height: 120,width: 120,fit: BoxFit.cover,),
                              )
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(padding: EdgeInsets.only(top: 70.0),child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Kate Winsilate",style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),)
                          ],
                        ),),
                      )
                    ],
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
          
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
          
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.person,color: Colors.black,),
                            SizedBox(width: 20.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,),),
                                Text("Kate Winsilate",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,),)
          
                              ],
                            )
                          ],
                        ),
                      ),
          
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
          
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
          
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.email,color: Colors.black,),
                            SizedBox(width: 20.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,),),
                                Text("katewinsilate0562@gmail.com",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,),)
          
                              ],
                            )
                          ],
                        ),
                      ),
          
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
          
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
          
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.description,color: Colors.black,),
                            SizedBox(width: 20.0,),
                            Text("Terms & Conditions",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,),)
          
          
                          ],
                        ),
                      ),
          
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
          
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
          
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.call,color: Colors.black,),
                            SizedBox(width: 20.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Mobile Number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,),),
                                Text("9000123876",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,),)
          
                              ],
                            )
                          ],
                        ),
                      ),
          
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
          
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
          
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.delete,color: Colors.black,),
                            SizedBox(width: 20.0,),
                            Text("Delete Account",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,),),
          
          
                          ],
                        ),
                      ),
          
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
          
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
          
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.logout,color: Colors.black,),
                            SizedBox(width: 20.0,),
                            Text("LogOut",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,),)
          
          
                          ],
                        ),
                      ),
          
                    ),
                  )
                ],
              ),
            ),
        ),
        );
    }
}