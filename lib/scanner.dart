import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';



class Scanner extends StatefulWidget {
  const Scanner({super.key, required this.title});


  final String title;

  @override
  State<Scanner> createState() => _Scanner();
}

class _Scanner extends State<Scanner> {
String qrCode ='';
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Scanner votre document",
        style: TextStyle(fontFamily: "Satisfy"),),
        centerTitle: true,
        elevation: 5.0,
      ),
      body:  Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Scanner Votre Document',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'Satisfy',
            ),),
          const SizedBox(
            height: 8,
          ),
          Text(qrCode,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontFamily: 'Satisfy',
            ),),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black26),
                  padding:
                  MaterialStateProperty.all(const EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () => scanQrCode(),
              child: const Text('Enabled Button')),
          const SizedBox(height: 20),
          const Text(
            'Scanner votre Document',
            textScaleFactor: 2,
          )
        ],
      ),)
      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> scanQrCode() async{
    try{
      qrCode =await FlutterBarcodeScanner.scanBarcode(
      '#5fa693',
          'cancel',
          true,
          ScanMode.QR,);
      if (!mounted) return;
      setState(()  {
        qrCode= qrCode;
      });
    } on PlatformException{
      qrCode='Failed to get platform version';
    }
  }

}
