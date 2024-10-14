import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mining/miningApp/constants.dart';
import 'package:mining/miningApp/settingScreen.dart';
import 'package:mining/miningApp/walletScreen.dart';
import 'miningScreen.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05086f),
      body: Stack(
        children: [
          Container(
            height: 218,
            width: 430,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: AppColors.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Image
                Image.asset(
                  "assets/topLogo.png",
                  width: 60,
                  height: 60,
                ),
                const SizedBox(height: 15), // Space between logo and text

                // Text for "Estimated Reward"
                Text(
                  'Estimated Reward: \$xxxx',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10), // Space between texts

                // Text for the actual reward value (or second text field)
                Text(
                  'Reward Date : xxxx-xx-xx',
                  // Placeholder for the reward value
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 202,
            left: -45,
            child: Container(
              height: 374,
              width: 518,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/middleImage.png"),
                ),
                color: AppColors.textColor,
              ),
            ),
          ),

// First Positioned Container with Text and Padding
          Positioned(
            top: 395,
            left: 20.55,
            right: 20.55,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20,),
                color: AppColors.primaryColor,
              ),
              width: 384.45,
              height: 216.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 40), // Add 60px padding from left
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Refer Friends, Earn Rewards', // Example text
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w900, // Heaviest weight
                        shadows: [
                          Shadow(
                            offset: Offset(0.5, 0.5),
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(0.9), // Dark shadow for emphasis
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:3 ),
                    Text(
                      'Share Your Referral link:', // Line 2
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'https://treasurecoin.com/ref', // Line 3 - Referral Link
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3), // Space between link and stats
                    Text(
                      'Referral Stats', // Line 4
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            offset: Offset(0.5, 0.5),
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(0.9), // Dark shadow for emphasis
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Friends Joined: [X]', // Line 5
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Commission Earned: \$[X]', // Line 6
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Referral Rewards: \$[X]', // Line 7
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Positioned(
            top: 650,
            left: 20.55,
            right: 20.55,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20,),
                color: AppColors.primaryColor,

              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Miners This Month',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w900, // Bold font for the title
                        color: Color(0xFF002366),shadows: [
                        Shadow(
                          offset: Offset(0.5, 0.5),
                          blurRadius: 1.0,
                          color: Colors.black.withOpacity(0.9), // Dark shadow for emphasis
                        ),
                      ], // Dark blue color
                      ),
                    ),
                    SizedBox(height: 1), // Space between title and leaderboard

                    // Leaderboard entries
                    Text(
                      '#1 JohnDoe - \$10,000',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF002366), // Dark blue color
                      ),
                    ),
                    SizedBox(height: 1), // Space between lines
                    Text(
                      '#2 JaneDoe - \$8,000',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF002366),
                      ),
                    ),
                    SizedBox(height: 1),
                    Text(
                      '#3 BobSmith - \$7,000',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF002366),
                      ),
                    ),
                    SizedBox(height: 1), // Space between leaderboard and the action text

                    // See Full Leaderboard
                    Text(
                      'See Full Leaderboard',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w700, // Bold font
                        color: Color(0xFF002366),
                        shadows: [
                          Shadow(
                            offset: Offset(0.5, 0.5),
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(0.9), // Dark shadow for emphasis
                          ),
                        ],                      ),
                    ),
                  ],
                ),
              ),
              
              width: 384,
              height: 150,
            ),
          ),
        ],
      ),
      
    );
  }
}
