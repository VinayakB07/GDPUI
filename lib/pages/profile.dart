import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/authentication_repository/authentication_repository.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }
  String? _userPhoneNumber;
  String? _userlocation;
  Future<void> _getUserDetails() async {
    _user = _auth.currentUser;
    if (_user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('UserDetail').doc(_user!.uid).get();
      if (userDoc.exists) {
        setState(() {
          _userPhoneNumber = userDoc.get('phoneNumber');
          _userlocation = userDoc.get('location');
        });
      }
    }
    setState(() {}); // Update the UI after obtaining the user details
  }
  Future<void> _updateLocation(String newLocation) async {
    try {
      _user = _auth.currentUser;
      if (_user != null) {
        await _firestore.collection('UserDetail').doc(_user!.uid).update({
          'location': newLocation,
        });
        setState(() {
          _userlocation = newLocation;
        });
      }
    } catch (e) {
      print('Error updating location: $e');
      // Handle update failure
    }
  }
  Future<void> _editLocation(BuildContext context) async {
    String newLocation = ''; // Initialize with current location or empty string

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Location'),
          content: TextFormField(
            onChanged: (value) {
              newLocation = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter new location',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Update the location in Firestore and refresh UI
                await _updateLocation(newLocation);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: _user != null
            ? SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [

                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _user!.photoURL != null
                          ? NetworkImage(_user!.photoURL!)
                          : AssetImage('images/prof.png') as ImageProvider,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20),
              Text(
                '${_user!.displayName ?? 'No name'}',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '${_user!.email ?? 'No email'}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.grey,
                height: 30,
                thickness: 1,
              ),

                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone Number'),
                  subtitle: Text('${_userPhoneNumber ?? 'No phone number'}'),
                  
                ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Location'),
                subtitle: Text('${_userlocation?? 'Not Set'}'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                   _editLocation(context);
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  AuthentiactionRepository.instance.logout();
                },
                child: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        )
            : Center(child: CircularProgressIndicator()), // Show loader while fetching user details
      ),
    );
  }
}
