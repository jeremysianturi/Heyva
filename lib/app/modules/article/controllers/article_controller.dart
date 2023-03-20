import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import '../../../../model/tag.dart';

class ArticleController extends GetxController {

  List<Tag> list = [
    Tag(tag: "Mental Health"),
    Tag(tag: "Articles"),
  ];

  // scrollbar
  var percentage = 0.0.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      percentage.value = (scrollController.position.pixels / scrollController.position.maxScrollExtent);
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}