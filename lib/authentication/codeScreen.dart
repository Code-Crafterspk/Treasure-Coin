// import 'package:flutter/material.dart';
//
// import 'login.dart';
//
// class CodeScreen extends StatefulWidget {
//   const CodeScreen({super.key});
//
//   @override
//   State<CodeScreen> createState() => _CodeScreenState();
// }
//
// class _CodeScreenState extends State<CodeScreen> {
//   final List<TextEditingController> _controllers =
//   List.generate(6, (_) => TextEditingController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background color for debugging
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/background.png'), // Ensure this image is added to your assets
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back, color: Colors.white),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Enter Code',
//                   style: TextStyle(
//                     fontSize: 28,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   'We have sent a password reset code to s***@**. Enter it below to reset Password.',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: List.generate(6, (index) {
//                     return SizedBox(
//                       width: 40,
//                       child: TextField(
//                         controller: _controllers[index],
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.number,
//                         maxLength: 1,
//                         decoration: InputDecoration(
//                           counterText: '',
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0xFFfbd034),
//                               width: 2.0,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0xFFfbd034),
//                               width: 2.0,
//                             ),
//                           ),
//                           filled: true,
//                           fillColor: Colors.transparent,
//                         ),
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: TextButton(
//                     onPressed: () {
//                       // Logic to resend the code
//                     },
//                     child: Text(
//                       "Don’t receive code? Resend Code",
//                       style: TextStyle(
//                         color: Color(0xFFfbd034),
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Logic to enter the code and verify
//                   },
//                   style: ElevatedButton.styleFrom(
//                     // primary: Color(0xFFfbd034), // Button color
//                     minimumSize: Size(double.infinity, 50), // Button width
//                   ),
//                   child: Text(
//                     'Enter',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
//
//                       },
//                     child: Text(
//                       'Already have an account? Login',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
