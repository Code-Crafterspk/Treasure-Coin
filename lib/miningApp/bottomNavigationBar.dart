import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mining/miningApp/constants.dart';
import 'package:mining/miningApp/mainScreen.dart';
import 'package:mining/miningApp/settingScreen.dart';
import 'package:mining/miningApp/walletScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'miningScreen.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({super.key});

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  final PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      mainScreen(),
      Miningscreen(),
      Walletscreen(),
      SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, color: AppColors.primaryColor),
        title: "Home", // Title added for underlining
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.work_outline, color: AppColors.primaryColor),
        title: "Mining", // Title added for underlining
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.wallet, color: AppColors.primaryColor),
        title: "Wallet", // Title added for underlining
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings, color: AppColors.primaryColor),
        title: "Settings", // Title added for underlining
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: controller,
      items: _navBarItems(),
      backgroundColor: Color(0xFF07096d),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20), // Adjust the border radius as needed
        colorBehindNavBar: Color(0xFF07096d),
      ),
      navBarStyle: NavBarStyle.style13, // Use style 13 for underline effect
      onItemSelected: (index) {
        setState(() {
          controller.index = index; // Update the selected index
        });
      },
    );
  }
}
