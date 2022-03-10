import '../flutter_flow/flutter_flow_rive_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final riveAnimationAnimationsList = [
    'Animation 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    riveAnimationAnimationsList.forEach((name) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Lottie.asset(
                'assets/lottie_animations/bgcolorsok.json',
                width: 150,
                height: 130,
                fit: BoxFit.fitHeight,
                animate: true,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final isPlaying = riveAnimationControllers
                  .any((controller) => controller.isActive);
              riveAnimationControllers.forEach((controller) {
                final animationLoopValue = controller.instance.animation.loop;
                if (animationLoopValue == Loop.loop ||
                    animationLoopValue == Loop.pingPong) {
                  controller.isActive = !isPlaying;
                }
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
              child: Container(
                width: 150,
                height: 130,
                child: RiveAnimation.asset(
                  'assets/rive_animations/circles_(2).riv',
                  artboard: 'New Artboard',
                  fit: BoxFit.fitHeight,
                  controllers: riveAnimationControllers,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
