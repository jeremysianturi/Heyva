import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

class myVidePlayer extends StatefulWidget {
  const myVidePlayer({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  State<myVidePlayer> createState() => _MyVidePlayer();
}

class _MyVidePlayer extends State<myVidePlayer> {
  late VideoPlayerController _videoPlayerController,
      _videoPlayerController2,
      _videoPlayerController3;

  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerWebController _customVideoPlayerWebController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(
    alwaysShowThumbnailOnVideoPaused: false,
    placeholderWidget: CircularProgressIndicator(),
    controlBarAvailable: true,
    playOnlyOnce: false,
  );

  final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings =
      CustomVideoPlayerWebSettings(
    src: longVideo,
  );

  @override
  void initState() {
    super.initState();




    _videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4#1',
    )..initialize().then((value) => _videoPlayerController.addListener(() {
          //custom Listner
          setState(() {
            if (_videoPlayerController.value.position ==
                _videoPlayerController.value.duration) {


                // bottomSheetMessage(color: "red", desc: "stop");

            }
            // if (!_videoPlayerController.value.isPlaying &&
            //     _videoPlayerController.value.isInitialized &&
            //     (_videoPlayerController.value.duration ==
            //         _videoPlayerController.value.position)) {
            //
            //
            //
            //   //checking the duration and position every time
            //   setState(() {});
            // }
          });
        }));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
    _customVideoPlayerController.videoPlayerController.play();
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.black.withOpacity(0.8),
      body: Stack(
        children: [
          Center(
            child: CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 32),
              child: const Header(
                  titleColor: ColorApp.txt_white,
                  showCenterTitle: true,
                  centerTitle: "Video",
                  rightText: Strings.login,
                  showIcon: true)),
        ],
      ),
    );
  }
}

String videoUrlLandscape =
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
String videoUrlPortrait =
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4';
String longVideo =
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

String video720 =
    "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4";

String video480 =
    "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_10mb.mp4";

String video240 =
    "https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_10mb.mp4";
