import 'package:flutter/material.dart';
import 'package:mining/miningApp/constants.dart';

import 'mainScreen.dart';

class Walletscreen extends StatefulWidget {
  const Walletscreen({super.key});

  @override
  _WalletscreenState createState() => _WalletscreenState();
}

class _WalletscreenState extends State<Walletscreen> {
  // Placeholder for API data
  String balance = 'XXX.XXX';
  String transactionDate = 'xxxx-xx-xx';
  String transactionType = 'Mining Reward, Sent, Received';
  String transactionAmount = 'xxx';
  String transactionStatus = 'confirmed/pending';
  String recipientAddress = 'xxx';
  String amount = 'xxx';
  String fee = 'xxx';
  String total = 'xxx';
  String receivingAddress = 'xx';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF07096d),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(17), // This controls the roundness of the bottom
          ),
        ),

        backgroundColor: Color(0xFFffd735),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>mainScreen()));
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28),
              Text(
                'Treasure Coin Balance : $balance',
                style: TextStyle(
                  color: Colors.yellow,
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Handle refresh balance click here
                },
                child: Row(
                  children: [
                    Icon(Icons.refresh, color: Colors.yellow),
                    SizedBox(width: 8),
                    Text(
                      'Refresh Balance',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Transaction History',
                style: TextStyle(
                  color: Colors.yellow,
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Date : $transactionDate\n'
                    'Type : $transactionType\n'
                    'Amount : $transactionAmount\n'
                    'Status : $transactionStatus',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  height: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Send Treasure Coin Screen',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Recipient Address: $recipientAddress\n'
                    'Amount: $amount\n'
                    'Fee: $fee\n'
                    'Total: $total',
                style: TextStyle(
                  color: Colors.yellow,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  height: 2,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  // Handle send treasure coin button click
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.yellow,
                  side: BorderSide(color: Colors.yellow),
                ),
                child: Text(
                  'Send Treasure Coin',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Receive Treasure Coin Screen',
                style: TextStyle(
                  color: Colors.yellow,
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'QR Code Display: (for receiving)\n'
                    'Address: $receivingAddress',
                style: TextStyle(
                  color: Colors.yellow,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 25),
              Column(
                children: [ElevatedButton(
                  onPressed: () {
                    // Handle withdraw button click
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFffd735),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.download, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Withdraw',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
