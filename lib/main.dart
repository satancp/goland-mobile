import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:goland_mobile_flutter/component/input/input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'goLand',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController vpc;
  final ratio = 1920 / 1080;

  @override
  void initState() {
    super.initState();
    this.vpc = VideoPlayerController.asset("assets/loginbg.mp4")
      ..initialize().then((_) {
        this.vpc.play();
        this.vpc.setLooping(true);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new ClipRect(
            child: new OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                alignment: Alignment.center,
                child: new FittedBox(
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    child: new Container(
                        width: MediaQuery.of(context).size.height * this.ratio,
                        height: MediaQuery.of(context).size.height,
                        child: new VideoPlayer(this.vpc))))),
        Container(
          color: Color(0x3FFFFFFF),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Container(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      color: Color(0x5F14C7CC),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                          child: Input(
                              text: "Username",
                              type: "normal",
                              icon: "assets/用户名icon.png"))),
                  SizedBox(
                    height: 10,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      color: Color(0x5F14C7CC),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      color: Color(0x5F14C7CC),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                          child: Input(
                              text: "Password",
                              type: "password",
                              icon: "assets/密码icon.png")))
                ],
              ),
            )),
          ),
        )
      ],
    );
  }
}
