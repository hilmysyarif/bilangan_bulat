import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'video_player.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return MaterialApp(
      title: 'BILANGAN BULAT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/Front.jpg",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
                Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(top: 90.0),
                    child: Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'BILANGAN',
                          style: TextStyle(
                            fontSize: 64.0,
                            fontFamily: 'Loopiejuice',
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 20
                              ..color = Colors.white,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'BILANGAN',
                          style: TextStyle(
                            fontFamily: 'Loopiejuice',
                            fontWeight: FontWeight.normal,
                            fontSize: 64.0,
                            color: Color(0xFFFD6D6D),
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    )),
                Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(top: 140.0),
                    child: Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'BULAT',
                          style: TextStyle(
                            fontSize: 64.0,
                            fontFamily: 'Loopiejuice',
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 20
                              ..color = Colors.white,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'BULAT',
                          style: TextStyle(
                            fontFamily: 'Loopiejuice',
                            fontWeight: FontWeight.normal,
                            fontSize: 64.0,
                            color: Color(0xFFFD6D6D),
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 90.0, right: 80),
        height: (MediaQuery.of(context).size.height * 0.15),
        width: MediaQuery.of(context).size.width * 0.5,
        child: FittedBox(
          child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Color(0xFFFD6D6D),
              child: Icon(
                Icons.play_arrow,
                size: 36,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BagianSatu()),
                );
              }),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
