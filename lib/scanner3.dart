import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';



class Scanner3 extends StatefulWidget {
  const Scanner3({super.key, required this.title});


  final String title;

  @override
  State<Scanner3> createState() => _Scanner3();
}

class _Scanner3 extends State<Scanner3> {
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

  Future<void> scanQrCode() async {

      MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              qrCode = barcode.rawValue!;
              debugPrint('Barcode found! $qrCode');
              if (!mounted) return;
              setState(()  {
                qrCode= qrCode;
              });
            }
          });

  }

}
