import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/breast_feeding/model/video_content_model.dart';
import 'package:heyva/app/modules/breast_feeding/provider/breast_feeding_provider.dart';
import 'package:heyva/app/widgets/reusable_bottomSheet_message.dart';
import 'package:heyva/services/dio_services.dart';
import 'package:miniplayer/miniplayer.dart';

class BreastFeedingController extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late BreastFeedingProvider _provider;

  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController customVideoPlayerController;
  var isShwoingVideo = false.obs;
  late MiniplayerController? miniPlayerC;
  var videoUrl =
      'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

  var videoTitle = "Title all video".obs;

  @override
  void onInit() {
    _client = DioClient();
    _provider = BreastFeedingProvider(_client.init());
    getVideoContent();

    miniPlayerC = MiniplayerController();
    super.onInit();
  }

  @override
  void dispose() {
    miniPlayerC?.dispose();
    videoPlayerController.dispose();
    super.dispose();
  }
  void initVideo() {
    CustomVideoPlayerSettings _customVideoPlayerSettings =
        const CustomVideoPlayerSettings(
      alwaysShowThumbnailOnVideoPaused: false,
      placeholderWidget: CircularProgressIndicator(),
      controlBarAvailable: true,
      playOnlyOnce: false,
      customAspectRatio: 175/80,
      autoFadeOutControls: true,
      settingsButtonAvailable: false,
    );

    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((value) => videoPlayerController.addListener(() {
            isShwoingVideo.value = true;
            if (videoPlayerController.value.position ==
                videoPlayerController.value.duration) {}
          }));

    customVideoPlayerController = CustomVideoPlayerController(
      context: Get.context!,
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
  }

  var videoContentResponse = VideoContentModel(
    success: "",
    data: null,
    message: null,
    error: null,
  ).obs;

  getVideoContent() async {
    isLoading.value = true;
    try {
      videoContentResponse.value = (await _provider.getListVideo(
          contentId: "b8f05ede-7f4f-4720-bc49-da00866097dc"))!;
      isLoading.value = false;

      if (videoContentResponse.value.success == "Success") {
      } else {
        bottomSheetMessage(
            color: "red", desc: videoContentResponse.value.message ?? "");
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  List<Tags> get tagsList {
    var data = videoContentResponse.value.data;
    return data?.tags ?? [];
  }

  List<Attachments> get attachmentsList {
    var data = videoContentResponse.value.data;
    return data?.attachments ?? [];
  }

  String get title {
    var data = videoContentResponse.value.data;
    return data?.title ?? "";
  }

  String get creator {
    var data = videoContentResponse.value.data;
    return data?.creator ?? "";
  }

  String get body {
    var data = videoContentResponse.value.data;
    return data?.body ?? "";
  }

  String get bannerImg {
    var data = videoContentResponse.value.data;
    return data?.banner ?? "";
  }
}
