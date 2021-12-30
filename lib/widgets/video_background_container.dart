import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoBackgroundContainer extends StatefulWidget {
  final String videoAsset;
  const VideoBackgroundContainer({Key? key, required this.videoAsset}) : super(key: key);

  @override
  State<VideoBackgroundContainer> createState() => _VideoBackgroundContainerState();
}

class _VideoBackgroundContainerState extends State<VideoBackgroundContainer> {
  late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset);
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });
  }

  void playVideo() {
    _controller = VideoPlayerController.asset(widget.videoAsset);
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // _controller = VideoPlayerController.asset(widget.videoAsset);

    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      child: Container(
          width: 1.sw,
          child: VideoPlayer(_controller)
      ),
    );
  }
}