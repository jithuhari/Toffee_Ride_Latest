import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer.open(Audio("assets/audios/welcome.mp3"),
        autoStart: true, showNotification: true);
    _assetsAudioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (context) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Lottie.asset(
              "assets/jsons/lottie/lottie_splash_screen.json",
              repeat: false,
              fit: BoxFit.fill,
              reverse: false,
              height: 400,
              width: 300,
              animate: true,
              delegates: LottieDelegates()
            ),
          )
        );
      }
    );
  }
}
