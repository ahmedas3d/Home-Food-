import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BalanceSheetController extends GetxController {
  final _isLoading = false.obs;
  final _balanceSheetData = <List<String>>[].obs;

  bool get isLoading => _isLoading.value;
  List<List<String>> get balanceSheetData => _balanceSheetData;

  void generateBalanceSheetPdf() async {
    _isLoading.value = true;

    // Add balance sheet data
    _balanceSheetData.value = [
      ['Assets', 'Amount'],
      ['Cash', '\$10,000'],
      ['Accounts Receivable', '\$20,000'],
      ['Inventory', '\$30,000'],
      ['Total Current Assets', '\$60,000'],
      ['Property, Plant and Equipment', '\$100,000'],
      ['Accumulated Depreciation', '(\$20,000)'],
      ['Net Property, Plant and Equipment', '\$80,000'],
      ['Total Assets', '\$140,000'],
      ['Liabilities', 'Amount'],
      ['Accounts Payable', '\$10,000'],
      ['Notes Payable', '\$20,000'],
      ['Total Current Liabilities', '\$30,000'],
      ['Long-Term Debt', '\$40,000'],
      ['Total Liabilities', '\$70,000'],
      ['Owner\'s Equity', 'Amount'],
      ['Common Stock', '\$50,000'],
      ['Retained Earnings', '\$20,000'],
      ['Total Owner\'s Equity', '\$70,000'],
      ['Total Liabilities and Owner\'s Equity', '\$140,000'],
    ];

    // Generate PDF
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(20),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Balance Sheet',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  )),
              pw.SizedBox(height: 10),
              pw.Text('As of ${DateTime.now().toString()}',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                cellPadding: const pw.EdgeInsets.all(5),
                headerDecoration: const pw.BoxDecoration(
                  color: PdfColors.grey300,
                ),
                data: _balanceSheetData.value,
              ),
            ],
          );
        },
      ),
    );

    // Save PDF file
    final file = File('balance_sheet.pdf');
    await file.writeAsBytes(await pdf.save());

    _isLoading.value = false;
    Get.snackbar('PDF Generated', 'The balance sheet PDF has been saved.');
  }
}
//
// class PortfolioPage extends StatefulWidget {
//   const PortfolioPage({Key? key}) : super(key: key);
//
//   @override
//   PortfolioPageState createState() => PortfolioPageState();
// }
//
// class PortfolioPageState extends State<PortfolioPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(
//             'assets/images/kodi.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 30),
//                 const CircleAvatar(
//                   radius: 80,
//                   backgroundImage: AssetImage('assets/images/logo.png'),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Abdalluh',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   'Flutter Developer',
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.8),
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 AnimatedBuilder(
//                   animation: _animation,
//                   builder: (context, child) {
//                     return Transform.rotate(
//                       angle: _animation.value * 2 * 3.14,
//                       child: child,
//                     );
//                   },
//                   child: Container(
//                     width: 150,
//                     height: 150,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 10,
//                           spreadRadius: 3,
//                         ),
//                       ],
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Flutter',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 30,
//                           fontFamily: 'Montserrat',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Portfolio Page',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Montserrat',
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

//
// class MyLoginPage extends StatefulWidget {
//   const MyLoginPage({Key? key}) : super(key: key);
//
//   @override
//   MyLoginPageState createState() => MyLoginPageState();
// }
//
// class MyLoginPageState extends State<MyLoginPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//     _animation = Tween<double>(begin: -300, end: 0).animate(
//         CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
//       ..addListener(() {
//         setState(() {});
//       });
//     _animationController.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(children: [
//       Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Colors.blue[400]!,
//               Colors.blue[700]!,
//             ],
//           ),
//         ),
//       ),
//       Positioned(
//         left: _animation.value,
//         child: Container(
//           width: 400,
//           height: MediaQuery.of(context).size.height,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(300),
//               bottomRight: Radius.circular(300),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Welcome Back',
//                   style: TextStyle(
//                     fontSize: 32.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 const Text(
//                   'Please login to your account',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 const SizedBox(height: 32.0),
//                 TextFormField(
//                   controller: _emailController,
//                   style: const TextStyle(fontSize: 16.0),
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.email),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   style: const TextStyle(fontSize: 16.0),
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.lock),
//                   ),
//                 ),
//                 const SizedBox(height: 32.0),
//                 RaisedButton(
//                   onPressed: () {},
//                   color: Colors.blue[700],
//                   textColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 32.0, vertical: 16.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(24.0),
//                   ),
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 GestureDetector(
//                   onTap: () {},
//                   child: const Text(
//                     'Forgot Password?',
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )
//     ]));
//   }
// }

// class PortfolioPage extends StatefulWidget {
//   const PortfolioPage({Key? key}) : super(key: key);
//
//   @override
//   PortfolioPageState createState() => PortfolioPageState();
// }
//
// class PortfolioPageState extends State<PortfolioPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return Transform.rotate(
//                   angle: _animation.value * 2 * 3.14,
//                   child: child,
//                 );
//               },
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.blue,
//                 ),
//                 child: const Center(
//                   child:  Text(
//                     'Abdalluh',
//                     style:  TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Portfolio Page',
//               style:  TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
