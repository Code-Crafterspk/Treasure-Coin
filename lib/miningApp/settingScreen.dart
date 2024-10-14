import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'image_picker.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _name = "";
  String? _email = "";
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  // Load name and email from SharedPreferences
  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? "Your Name";
      _email = prefs.getString('email') ?? "Your Email";
    });
  }

  // Function to update the profile image URL
  void _updateProfileImage(String imageUrl) {
    setState(() {
      _profileImageUrl = imageUrl;
    });

    // Optionally, save the imageUrl to shared preferences or database here
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('profileImageUrl', imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textColor,
      appBar: AppBar(
        backgroundColor: Color(0xFFffd735),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: ImageIcon(
              AssetImage("assets/img_13.png"),
              size: 30,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ImagePickerWidget(onImageUpload: _updateProfileImage),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      height: 3,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name:  $_name',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: AppColors.primaryColor)),
                      Text('E-mail:  $_email',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: AppColors.primaryColor,
                              height: 3)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Text('Terms & Conditions',
                      style: TextStyle(
                          fontFamily: 'Montserrat', color: Colors.yellow)),
                  onTap: () {
                    // Handle Terms & Conditions tap
                  },
                ),
                ListTile(
                  title: Text('Privacy Policy',
                      style: TextStyle(
                          fontFamily: 'Montserrat', color: Colors.yellow)),
                  onTap: () {
                    // Handle Privacy Policy tap
                  },
                ),
                SizedBox(height: 20),
                _buildMenuItem(Icons.notifications, '     Notification', () {
                  // Handle Notification tap
                  print('Notification tapped');
                }),
                _buildMenuItem(Icons.help, '     Support', () {
                  // Handle Support tap
                  print('Support tapped');
                }),
                _buildMenuItem(Icons.contact_mail, '     Contact us', () {
                  // Handle Contact Us tap
                  print('Contact us tapped');
                }),
                _buildMenuItem(Icons.logout, '     Log out', () {
                  print('Log out tapped');
                  // Add your log out logic here
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.yellow),
      title: Text(label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            color: Colors.yellow,
          )),
      onTap: onTap,
    );
  }
}
