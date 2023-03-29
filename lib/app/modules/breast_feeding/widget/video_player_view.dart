import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:heyva/app/widgets/reusable_header.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/strings.dart';

class myVidePlayer extends StatefulWidget {
  const myVidePlayer({Key? key, required this.videoUrl, this.seekVideo})
      : super(key: key);

  final String videoUrl;
  final Duration? seekVideo;

  @override
  State<myVidePlayer> createState() => _MyVidePlayer();
}

class _MyVidePlayer extends State<myVidePlayer> {
  late VideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(
    alwaysShowThumbnailOnVideoPaused: false,
    placeholderWidget: CircularProgressIndicator(),
    controlBarAvailable: true,
    playOnlyOnce: false,
  );

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(
      widget.videoUrl,
    )..initialize().then((value) => _videoPlayerController.addListener(() {
          setState(() {
            debugPrint("position video player ${_videoPlayerController.value.position}");

            if (_videoPlayerController.value.position < 1.seconds) {
              if (widget.seekVideo! > Duration.zero) {
                _videoPlayerController.seekTo(widget.seekVideo!);
              }
            }

            if (_videoPlayerController.value.position ==
                _videoPlayerController.value.duration) {}
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
