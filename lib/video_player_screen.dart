import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icehockeyrobot/constants.dart';
import 'package:icehockeyrobot/root_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  Timer? countDownTimer;
  int countDownSecond = 11;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/home/demo123.mp4')
      ..initialize().then((_) {
        // 确保视频初始化完成后更新UI
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child:
                _controller.value.isInitialized
                    ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: Constants.screenWidth(context),
                          height: Constants.screenHeight(context),
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    )
                    : CircularProgressIndicator(),
          ),
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "images/home/launch_screen_potent_icon.png",
                width: 37 * 4,
                height: 22.8 * 4,
              ),
            ),
          ),

          Positioned(
            bottom: 85,
            left: 60,
            right: 60,
            child: Container(
              child: Image.asset(
                "images/home/launch_screen_robot_icon.png",
                width: 76.4,
                height: 81,
              ),
            ),
          ),

          Positioned(
            top: 51,
            right: 17,
            child: GestureDetector(
              onTap: () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
                countDownTimer = Timer.periodic(Duration(milliseconds: 1000), (
                  timer,
                ) async {
                  if (countDownSecond == 1) {
                    /// 倒计时结束，
                    print("跳转界面");
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                RootController(),
                        transitionDuration: Duration.zero, // 去除跳转动画
                        reverseTransitionDuration: Duration.zero, // 去除返回动画
                      ),
                    );
                    countDownTimer?.cancel();
                  }
                  countDownSecond--;
                  if (mounted) {
                    setState(() {});
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(45, 45, 57, 0.36),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Center(
                  child: Constants.mediumWhiteTextWidget(
                    "Skip",
                    14,
                    Colors.white,
                  ),
                ),
                width: 52,
                height: 25,
              ),
            ),
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _controller.value.isPlaying
      //           ? _controller.pause()
      //           : _controller.play();
      //     });
      //   },
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
