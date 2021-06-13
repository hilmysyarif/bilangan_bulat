import 'package:flutter/material.dart';
import 'package:tugasakhir/video_player.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new MathQuiz();

class MathQuiz {
  var questions = [
    "Hasil dari 12 + ( - 20 ) = . . . .",
    "Pada pagi hari, suhu udara di daerah Dieng - 5 ℃. Pada siang hari suhu udara naik 12 ℃. Berapakah suhu udara pada siang hari ?",
    "Hasil dari 234 X ( - 5 ) = . . . .",
    "Penulisan perbandingan yang tepat adalah ....",
    "Pak Sulistyo membeli 7 bungkus permen. Setiap bungkus berisi 40 permen. Permen tersebut dibagikan kepada 20 siswa sama banyak. Setiap siswa memperoleh . . . permen.",
  ];

  var choices = [
    ["8", "– 8", "32", "– 32"],
    ["19 ℃", "7 ℃", "- 7 ℃", "-19 ℃"],
    ["1.150", "1.170", "- 1.170", "– 1.150"],
    ["– 8 < 0", "12 = ( - 12)", "– 3 > - 1", "5 < (-5)"],
    ["14", "260", "280", "300"],
  ];

  var correctAnswers = ["– 8", "7 ℃", "- 1.170", "– 8 < 0", "14"];

  var backColor = [
    Color(0xFFD1C095),
    Color(0xFFC2ECF0),
    Color(0xFFE0909B),
    Color(0xFFD3C49B),
    Color(0xFFDEB3A2),
  ];
}

class Quiz1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: quiz.backColor[questionNumber],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(),
              SizedBox(height: 10.0),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.all(20.0)),
                    new Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Text(
                        quiz.questions[questionNumber],
                        style: new TextStyle(
                          fontFamily: 'Loopiejuice',
                          fontWeight: FontWeight.normal,
                          fontSize: 24.0,
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //button 1
                        new MaterialButton(
                          height: 100.0,
                          minWidth: MediaQuery.of(context).size.width - 60,
                          color: Colors.white,
                          onPressed: () {
                            if (quiz.choices[questionNumber][0] ==
                                quiz.correctAnswers[questionNumber]) {
                              debugPrint("Correct");
                              finalScore++;
                              updateQuestion();
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Quis(
                                      data: 'SALAH!',
                                      soal_num: questionNumber,
                                      isPlayed: true,
                                    ),
                                  ));
                              debugPrint("Wrong");
                            }
                          },
                          child: new Text(
                            quiz.choices[questionNumber][0],
                            style: new TextStyle(
                                fontSize: 20.0, color: Color(0xFF222222)),
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //button 2
                        new MaterialButton(
                          height: 100.0,
                          minWidth: MediaQuery.of(context).size.width - 60,
                          color: Colors.white,
                          onPressed: () {
                            if (quiz.choices[questionNumber][1] ==
                                quiz.correctAnswers[questionNumber]) {
                              debugPrint("Correct");
                              finalScore++;
                              updateQuestion();
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Quis(
                                          data: 'SALAH!',
                                          soal_num: questionNumber,
                                          isPlayed: true,
                                        )),
                              );
                              debugPrint("Wrong");
                            }
                          },
                          child: new Text(
                            quiz.choices[questionNumber][1],
                            style: new TextStyle(
                                fontSize: 20.0, color: Color(0xFF222222)),
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //button 3
                        new MaterialButton(
                          height: 100.0,
                          minWidth: MediaQuery.of(context).size.width - 60,
                          color: Colors.white,
                          onPressed: () {
                            if (quiz.choices[questionNumber][2] ==
                                quiz.correctAnswers[questionNumber]) {
                              debugPrint("Correct");
                              finalScore++;
                              updateQuestion();
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Quis(
                                          data: 'SALAH!',
                                          soal_num: questionNumber,
                                          isPlayed: true,
                                        )),
                              );
                              debugPrint("Wrong");
                            }
                          },
                          child: new Text(
                            quiz.choices[questionNumber][2],
                            style: new TextStyle(
                                fontSize: 20.0, color: Color(0xFF222222)),
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //button 4
                        new MaterialButton(
                          height: 100.0,
                          minWidth: MediaQuery.of(context).size.width - 60,
                          color: Colors.white,
                          onPressed: () {
                            if (quiz.choices[questionNumber][3] ==
                                quiz.correctAnswers[questionNumber]) {
                              debugPrint("Correct");
                              finalScore++;
                              updateQuestion();
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Quis(
                                          data: 'SALAH!',
                                          soal_num: questionNumber,
                                          isPlayed: true,
                                        )),
                              );
                              debugPrint("Wrong");
                            }
                          },
                          child: new Text(
                            quiz.choices[questionNumber][3],
                            style: new TextStyle(
                                fontSize: 20.0, color: Color(0xFF222222)),
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.all(15.0)),
                  ],
                ),
              ))
            ],
          ),
        ));
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: finalScore * 20,
                    )));
      } else {
        var isPlayed = (questionNumber > 0) ? true : false;
        questionNumber++;
        var num = questionNumber + 1;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Quis(
                    data: 'SOAL $num',
                    soal_num: questionNumber,
                    isPlayed: isPlayed,
                  )),
        );
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  final assetsAudioPlayer = AssetsAudioPlayer.withId("0");

  Summary({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assetsAudioPlayer.stop();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
            margin: const EdgeInsets.only(bottom: 60.0, right: 80),
            height: (MediaQuery.of(context).size.height * 0.3),
            width: MediaQuery.of(context).size.width * 0.5,
            child: FittedBox(
              child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Color(0xFFFD6D6D),
                  child: Text(
                    '$score',
                    style: TextStyle(
                      fontFamily: 'Loopiejuice',
                      fontWeight: FontWeight.normal,
                      fontSize: 28.0,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  onPressed: () {
                    questionNumber = 0;
                    finalScore = 0;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => exit(0)),
                    );
                  }),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
