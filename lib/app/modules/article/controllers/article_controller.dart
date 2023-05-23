import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/article/model/detail_article_model.dart';
import 'package:heyva/app/modules/article/provider/article_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';


class ArticleController extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late ArticleProvider _articleProvider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;
  var isSelectedTab = "".obs;

  // scrollbar
  var percentage = 0.0.obs;
  late ScrollController scrollController;

  dynamic argumentData = Get.arguments;

  String get contentId {
    return argumentData[Keys.contentIDArticleArguments].toString();
  }

  List<Tags> get tagsList {
    var data = detailArticleResponse.value.data?[0].tags;
    debugPrint("check value taglist: ${data?.length}");
    return data ?? [];
  }

  String get title {
    var data = detailArticleResponse.value.data?[0];
    return data?.title ?? "";
  }

  String get renderedBody {
    var data = detailArticleResponse.value.data?[0];
    return data?.renderedBody ?? "";
  }

  String get imgUrl {
    var data = detailArticleResponse.value.data?[0];
    return data?.banner ?? "";
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      percentage.value = (scrollController.position.pixels /
          scrollController.position.maxScrollExtent);
    });

    _client = DioClient();
    _articleProvider = ArticleProvider(_client.init());
    getListContent();

    super.onInit();
  }

  var detailArticleResponse =
      DetailArticleModel(success: "", data: null, message: "", error: "").obs;

  getListContent() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      detailArticleResponse.value =
          (await _articleProvider.getDetailArticle(contentId: contentId))!;
      isLoading.value = false;

      if (detailArticleResponse.value.success == "Success") {
      } else {
        errorMessage.value =
            detailArticleResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
