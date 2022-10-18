import 'package:flutter/material.dart';
import 'package:signaturefin/scanner.dart';
import 'package:signaturefin/scanner2.dart';
import 'package:signaturefin/scanner3.dart';
import 'package:signaturefin/scanner4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DocSign',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'DocSign'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget> [
          IconButton( icon: const Icon(Icons.qr_code_scanner), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Scanner2(title: 'Scanner votre Document',))); },)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader( // <-- SEE HERE
              decoration: BoxDecoration(color: Color(0xff764abc)),
              accountName: Text(
                "Zeh Bikanga",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Satisfy',
                ),
              ),
              accountEmail: Text(
                "zehbikanga@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Satisfy',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.document_scanner,
              ),
              title: const Text('Scanner votre Document',),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Scanner(title: 'Scanner votre Document')));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.history_outlined,
              ),
              title: const Text('Historique'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.black54,),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text('Parametres'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Scanner3(title: 'Scanner votre Document')));;
              },
            ),
            const AboutListTile( // <-- SEE HERE
              icon: Icon(
                Icons.info,
              ),
              applicationIcon: Icon(
                Icons.local_play,
              ),
              applicationName: 'DocSign',
              applicationVersion: '1.0.0',
              applicationLegalese: '© 2022 Memoire',
              aboutBoxChildren: [
                ///Content goes here...
              ],
              child: Text('About app'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/fonts.png')
        ],
      ),
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
