import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toffee_ride/utils/utils.dart';
import 'package:toffee_ride/widgets/page_background.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late final _assetsAudioPlayer = AssetsAudioPlayer();

  //animation
  late AnimationController _viewContentAnimationController;
  late AnimationController _superParentAnimationController;
  late AnimationController _logoutAnimationController;
  late Animation<Offset> _viewContentAnimation;
  late Animation<Offset> _superParentAnimation;
  late Animation<Offset> _logoutAnimation;

  bool _isShowInitial = true;
  bool _isShowMenu = false;
  bool _isAnimate = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addObserver(this);
    _createAnimation();
    _initAudio();
  }

  @override
  void dispose() {
    _viewContentAnimationController.dispose();
    _superParentAnimationController.dispose();
    _logoutAnimationController.dispose();

    _assetsAudioPlayer.stop();
    _assetsAudioPlayer.dispose();

    WidgetsBinding.instance?.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    //to pause audio play when goes background
    final isInForeground = state == AppLifecycleState.resumed;
    if (isInForeground) {
      if (!_assetsAudioPlayer.isPlaying.value) {
        _assetsAudioPlayer.play();
      }
    } else {
      _assetsAudioPlayer.pause();
    }
  }

  //init audio
  _initAudio() {
    _assetsAudioPlayer.open(Audio("assets/audios/home.mp3"));
    _assetsAudioPlayer.setLoopMode(LoopMode.single);
  }

  //init animation
  _createAnimation() {
    _viewContentAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..addListener(() => setState(() {}));
    _superParentAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..addListener(() => setState(() {}));
    _logoutAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..addListener(() => setState(() {}));
  }

  _animationForward() {
    _viewContentAnimationController.forward();
    _superParentAnimationController.forward();
    _logoutAnimationController.forward();
  }

  _animationBackward() {
    _viewContentAnimationController.reverse();
    _superParentAnimationController.reverse();
    _logoutAnimationController.reverse();
  }

  _showMenu() async {
    if (_isAnimate) {
      return;
    }
    _isAnimate = true;

    setState(() {
      _isShowInitial = false;
    });

    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      _isShowMenu = true;
    });

    _animationForward();

    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      _isAnimate = false;
    });
  }

  _hideMenu() async {
    if (_isAnimate) {
      return;
    }
    _isAnimate = true;

    setState(() {
      _isShowMenu = false;
    });

    _animationBackward();

    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      _isShowInitial = true;
    });

    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      _isAnimate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.height >
        MediaQuery.of(context).size.width) {
      //in protrait
      _viewContentAnimation = Tween(
              begin: const Offset(0.0, 0.0),
              end: Offset(-(MediaQuery.of(context).size.width / 2.75),
                  -(MediaQuery.of(context).size.height / 2.6)))
          .animate(_viewContentAnimationController);

      _superParentAnimation = Tween(
              begin: const Offset(0.0, 0.0),
              end: Offset(0.0, -(MediaQuery.of(context).size.height / 1.8)))
          .animate(_superParentAnimationController);

      _logoutAnimation = Tween(
              begin: const Offset(0.0, 0.0),
              end: Offset(MediaQuery.of(context).size.width / 2.75,
                  -(MediaQuery.of(context).size.height / 2.6)))
          .animate(_logoutAnimationController);
    } else {
      _viewContentAnimation = Tween(
              begin: const Offset(0.0, 0.0),
              end: Offset(-(MediaQuery.of(context).size.width / 3),
                  -(MediaQuery.of(context).size.height / 3)))
          .animate(_viewContentAnimationController);

      _superParentAnimation = Tween(
              begin: const Offset(0.0, 0.0),
              end: Offset(0.0, -(MediaQuery.of(context).size.height / 2)))
          .animate(_superParentAnimationController);

      _logoutAnimation = Tween(
              begin: const Offset(0.0, 0.0),
              end: Offset(MediaQuery.of(context).size.width / 3,
                  -(MediaQuery.of(context).size.height / 3)))
          .animate(_logoutAnimationController);
    }

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return VisibilityDetector(
            key: const Key("default_visibility_key"),
            onVisibilityChanged: (visibilityInfo) {
              var visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage == 100) {
                if (!_assetsAudioPlayer.isPlaying.value) {
                  _assetsAudioPlayer.play();
                }
              } else {
                _assetsAudioPlayer.pause();
              }
            },
            child: Scaffold(
                body: Stack(
              children: [
                const PageBackground(imagePath: "assets/images/home/sky.png"),
                _toolbar(context),
                const PageBackground(imagePath: "assets/images/home/hill.png"),
                AnimatedOpacity(
                  opacity: _isShowInitial ? 1 : 0,
                  duration: const Duration(milliseconds: 700),
                  curve: _isShowInitial ? Curves.easeIn : Curves.easeOut,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      "assets/images/home/elements.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: IconButton(
                        icon: Image.asset(
                          _isShowMenu
                              ? "assets/images/buttons/play.png"
                              : "assets/images/buttons/menu.png",
                        ),
                        iconSize: 60,
                        onPressed: () {
                          _isShowMenu ? _hideMenu() : _showMenu();
                        }),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isShowInitial ? 1 : 0,
                  duration: const Duration(milliseconds: 700),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: IconButton(
                        icon: Image.asset(
                          "assets/images/buttons/play.png",
                        ),
                        iconSize: 90,
                        onPressed: () {
                          Get.toNamed('/accounts');
                        },
                      ),
                    ),
                  ),
                ),

                if (_isShowMenu && !_isAnimate) _toolbar(context)
                //_toolbar(context),
              ],
            )),
          );
        });
  }

  Widget _toolbar(BuildContext context) {
    final HomeController _controller = Get.find();

    return Positioned.fill(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedBuilder(
            animation: _viewContentAnimationController,
            builder: (context, child) {
              return Transform.translate(
                offset: _viewContentAnimation.value,
                child: IconButton(
                  icon: Image.asset(
                    "assets/images/home/view_content.png",
                  ),
                  iconSize:
                      getDeviceType(context) == DeviceType.phone ? 150 : 170,
                  onPressed: () {
                    _controller.tappedOnViewContentsButton();
                  },
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _superParentAnimationController,
            builder: (context, child) {
              return Transform.translate(
                offset: _superParentAnimation.value,
                child: IconButton(
                  icon: Image.asset(
                    "assets/images/home/parent.png",
                  ),
                  iconSize:
                      getDeviceType(context) == DeviceType.phone ? 150 : 170,
                  onPressed: () {
                    _controller.tappedOnSuperParentButton();
                  },
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _logoutAnimationController,
            builder: (context, child) {
              return Transform.translate(
                offset: _logoutAnimation.value,
                child: IconButton(
                  icon: Image.asset(
                    "assets/images/home/logout.png",
                  ),
                  iconSize:
                      getDeviceType(context) == DeviceType.phone ? 150 : 170,
                  onPressed: () {
                    _controller.tappedOnLogoutButton();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
