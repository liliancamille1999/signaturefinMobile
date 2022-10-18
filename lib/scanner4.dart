import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';



class Scanner4 extends StatefulWidget {
  const Scanner4({super.key, required this.title});


  final String title;

  @override
  State<Scanner4> createState() => _Scanner4();
}

class _Scanner4 extends State<Scanner4> {


  @override
  Widget build(BuildContext context) {

    MobileScannerController cameraControler=MobileScannerController();

    return Scaffold(
        //appBar: AppBar(
         // backgroundColor: Colors.cyan,
         // title: const Text("Scanner votre document",
         //   style: TextStyle(fontFamily: "Satisfy"),),
         // centerTitle: true,
        //  elevation: 5.0,
        //),
        body:MobileScanner(
            allowDuplicates: false,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
              }
            }),
       );
  }


}
