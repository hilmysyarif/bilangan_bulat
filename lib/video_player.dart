import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'quiz.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class BagianSatu extends StatefulWidget {
  @override
  _BagianSatuState createState() => _BagianSatuState();
}

class _BagianSatuState extends State<BagianSatu> {
  late VideoPlayerController playerController;
  bool isShowed = false;

  @override
  void initState() {
    super.initState();

    playerController = VideoPlayerController.asset(
      "assets/BAGIAN-A.mp4",
    );

    playerController.addListener(() {
      setState(() {});
    });
    playerController.setLooping(false);
    playerController.initialize().then((_) => setState(() {}));
    playerController.play();
    munculButton();
  }

  @override
  void dispose() {
    playerController.dispose();

    super.dispose();
  }

  munculButton() {
    Future.delayed(
        Duration(seconds: 1),
        // Duration(seconds: 244),
        () => setState(() {
              isShowed = true;
            }));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Center(
              child: AspectRatio(
                  aspectRatio: MediaQuery.of(context).size.width /
                      MediaQuery.of(context).size.height,
                  child: Container(
                    child: (playerController != null
                        ? VideoPlayer(
                            playerController,
                          )
                        : Container()),
                  ))),
          floatingActionButton: isShowed == false
              ? Container()
              : Container(
                  margin: EdgeInsets.only(top: 20, right: 10),
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
                            MaterialPageRoute(
                                builder: (context) => BagianDua()),
                          );
                        }),
                  ),
                ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        ));
  }
}

class BagianDua extends StatefulWidget {
  const BagianDua({Key? key}) : super(key: key);

  @override
  _BagianDuaState createState() => _BagianDuaState();
}

class _BagianDuaState extends State<BagianDua> {
  late VideoPlayerController playerController;
  bool isShowed = false;

  @override
  void initState() {
    super.initState();

    playerController = VideoPlayerController.asset(
      "assets/BAGIAN-B.mp4",
    );

    playerController.addListener(() {
      setState(() {});
    });
    playerController.setLooping(false);
    playerController.initialize().then((_) => setState(() {}));
    playerController.play();
    munculButton();
  }

  @override
  void dispose() {
    playerController.dispose();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  munculButton() {
    Future.delayed(
        // Duration(seconds: 182),
        Duration(seconds: 1),
        () => setState(() {
              isShowed = true;
            }));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Center(
              child: AspectRatio(
                  aspectRatio: MediaQuery.of(context).size.width /
                      MediaQuery.of(context).size.height,
                  child: Container(
                    child: (playerController != null
                        ? VideoPlayer(
                            playerController,
                          )
                        : Container()),
                  ))),
          floatingActionButton: isShowed == false
              ? Container()
              : Container(
                  margin: EdgeInsets.only(top: 20, right: 10),
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
                            MaterialPageRoute(
                                builder: (context) => Quis(
                                      data: 'SOAL 1',
                                      soal_num: 0,
                                      isPlayed: false,
                                    )),
                          );
                        }),
                  ),
                ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        ));
  }
}

var quizBackColor = new BackColor();

class BackColor {
  var backColor = [
    Color(0xFFD1C095),
    Color(0xFFC2ECF0),
    Color(0xFFE0909B),
    Color(0xFFD3C49B),
    Color(0xFFDEB3A2),
  ];
}

class Quis extends StatefulWidget {
  final bool isPlayed;

  // ignore: non_constant_identifier_names
  const Quis(
      {required this.data,
      required this.soal_num,
      required this.isPlayed,
      Key? key})
      : super(key: key);

  final String data;
  // ignore: non_constant_identifier_names
  final int soal_num;

  @override
  _QuisState createState() => _QuisState();
}

class _QuisState extends State<Quis> {
  final audios = <Audio>[
    Audio.network(
      'https://drive.google.com/uc?export=view&id=1YEDMnIAxCc4EJphU1okgUrQzCLesEWL1',
    ),
  ];

  final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
  final List<StreamSubscription> _subscriptions = [];
  set isPlayed(bool isPlayed) {}

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    _subscriptions.add(assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print('playlistAudioFinished : $data');
    }));
    _subscriptions.add(assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print('audioSessionId : $sessionId');
    }));
    _subscriptions
        .add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
      return false;
    }));
    super.initState();
    openPlayer();
  }

  void openPlayer() async {
    await assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: false,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    Audio find(List<Audio> source, String fromPath) {
      return source.firstWhere((element) => element.path == fromPath);
    }

    if (widget.isPlayed == false) {
      assetsAudioPlayer.play();
    }

    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: quizBackColor.backColor[widget.soal_num],
          body: Center(
            child: new Text(
              widget.data,
              style: TextStyle(
                fontFamily: 'Loopiejuice',
                fontWeight: FontWeight.normal,
                fontSize: 64.0,
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
          ),
          floatingActionButton: Container(
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
                      MaterialPageRoute(builder: (context) => Quiz1()),
                    );
                  }),
            ),
          ),
        ));
  }
}
