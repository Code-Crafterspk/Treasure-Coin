import 'package:flutter/material.dart';
import 'package:mining/miningApp/mainScreen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Miningscreen extends StatefulWidget {
  const Miningscreen({super.key});

  @override
  State<Miningscreen> createState() => _MiningscreenState();
}

class _MiningscreenState extends State<Miningscreen> {
  @override
  Widget build(BuildContext context) {
    // Define the data for the Spline Range Area
    final List<SplineRangeAreaData> data = [
      SplineRangeAreaData('Mon', 200, 500),
      SplineRangeAreaData('Tue', 250, 450),
      SplineRangeAreaData('Wed', 300, 600),
      SplineRangeAreaData('Thu', 350, 550),
      SplineRangeAreaData('Fri', 400, 700),
      SplineRangeAreaData('Sat', 450, 800),
      SplineRangeAreaData('Sun', 300, 600),
    ];

    // Getting the screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffd735),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10,top: 15),
          child: IconButton(
            icon: ImageIcon(AssetImage("assets/img_13.png"),
            size: 30,
            color: Colors.black,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>mainScreen()));
              },
          ),
        ),
        elevation: 0,
      ),

      backgroundColor: const Color(0xFF07096d),
      body: Column(
        children: [
          // Top portion of the screen for the chart
          SizedBox(
            height: screenHeight * 0.25, // Occupies 30% of the screen height
            child: Container(
              color: const Color(0xFFffd735), // Yellow background
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(), // X-axis with categorical values
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 1500,
                  interval: 300, // Y-axis range and interval
                ),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.top, // Position legend at the top
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                tooltipBehavior: TooltipBehavior(enable: true), // Enable tooltips
                series: <CartesianSeries>[
                  SplineRangeAreaSeries<SplineRangeAreaData, String>(
                    name: 'Energy',
                    dataSource: data, // Provide the data source
                    xValueMapper: (SplineRangeAreaData data, _) => data.day,
                    highValueMapper: (SplineRangeAreaData data, _) => data.high,
                    lowValueMapper: (SplineRangeAreaData data, _) => data.low,
                    color: const Color(0xFF010670).withOpacity(0.4), // Deep blue area with opacity
                    borderColor: const Color(0xFF010670), // Deep blue border color
                    borderWidth: 2,
                    dataLabelSettings: const DataLabelSettings(isVisible: false), // Hide values
                  ),
                ],
              ),
            ),
          ),

          // Middle portion with the background image and overlay text
          SizedBox(
            height: screenHeight * 0.35, // Occupies 35% of the screen height
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background image
                Image.asset(
                  'assets/middleImage.png', // Path to your image
                  fit: BoxFit.cover,
                ),
                // Text over the image


              ],

            ),
          ),
          Text(

            'Next Reward in:  XXd XXh XXm XXs',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.yellow,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 17),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hash Rate: XXX MH/s',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'Montserrat',
            
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Blocks Mined: XX',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'Montserrat',
            
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Mining Speed: XXX KH/s',
            
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Data class for the spline range area chart
class SplineRangeAreaData {
  final String day;
  final double low;
  final double high;

  SplineRangeAreaData(this.day, this.low, this.high);
}
