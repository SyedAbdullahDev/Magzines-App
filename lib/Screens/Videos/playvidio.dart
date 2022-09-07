import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerItem({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);

        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      });
  }

  @override
  void dispose() {
    super.dispose();

    videoPlayerController.dispose();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onTap: () {
              if (videoPlayerController.value.isPlaying) {
                videoPlayerController.pause();
              } else {
                videoPlayerController.play();
              }
              setState(() {});
            },
            child: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: VideoPlayer(videoPlayerController),
            ),
          ),
          Positioned(
            top: 20,
            left: 15,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 6,
            child: Text(
              "Total Duration: " +
                  videoPlayerController.value.duration.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
              bottom: 15,
              left: 5,
              right: 5,
              child: VideoProgressIndicator(videoPlayerController,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    backgroundColor: Colors.white,
                    playedColor: Colors.blue,
                  ))),
        ],
      ),
    );
  }
}
