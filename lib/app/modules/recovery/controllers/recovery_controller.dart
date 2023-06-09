import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/learn/model/program_list_model.dart';
import 'package:heyva/app/modules/learn/provider/learn_provider.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart';
import 'package:heyva/app/modules/related_program/model/tags_model.dart'
    as tags;
import 'package:heyva/app/modules/related_program/provider/related_program_provider.dart';
import 'package:heyva/services/dio_services.dart';
import 'package:html/parser.dart';

class RecoveryController extends GetxController {
  var isLoading = false.obs;
  late DioClient _client;
  late RelatedProgramProvider _programProvider;
  late LearnProvider _learnProvider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;
  var isSelectedTab = "".obs;

  int get programLength {
    var data = contentListResponse.value.data?.length ?? 0;
    return data > 2 ? 2 : data;
  }

  @override
  void onInit() {
    _client = DioClient();
    _programProvider = RelatedProgramProvider(_client.init());
    _learnProvider = LearnProvider(_client.init());
    getTagList();
    getListContent(tags: "");
    postLogin();
    super.onInit();
  }

  var tagListResponse =
      tags.TagsModel(success: "", data: null, message: "", error: "").obs;
  var tagList = <tags.Data>[].obs;

  getTagList() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      tagListResponse.value = (await _programProvider.getTags())!;
      isLoading.value = false;

      if (tagListResponse.value.success == "Success") {
        tagList.clear();
        tagList.add(tags.Data(
            icon: "",
            id: "",
            name: "All Program",
            parent: "",
            type: "",
            value: "",
            isSelected: true));
        tagListResponse.value.data?.forEach((e) {
          tagList.add(e);
        });
      } else {
        errorMessage.value = tagListResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  ontapProgramsTab({required int index}) {
    tagList.firstWhereOrNull((e) => e.isSelected == true)?.isSelected = false;
    tagList[index].isSelected = true;
    tagList.refresh();
    var tags = tagList.firstWhereOrNull((e) => e.isSelected == true)?.id ?? "";
    getListContent(tags: tags);
  }

  var contentListResponse =
      ContentListModel(success: "", data: null, message: "", error: "").obs;

  getListContent({required tags}) async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      contentListResponse.value =
          (await _programProvider.getContentList(tagId: tags))!;
      isLoading.value = false;

      if (contentListResponse.value.success == "Success") {
      } else {
        errorMessage.value =
            contentListResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  var programListResponse =
      ProgramListModel(success: "", data: null, message: "", error: "").obs;

  postLogin() async {
    errorMessage.value = "";
    isLoading.value = true;
    try {
      programListResponse.value = (await _learnProvider.getProgramList())!;
      isLoading.value = false;

      if (programListResponse.value.success == "Success") {
      } else {
        errorMessage.value =
            programListResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("error  $e");
    }
  }

  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String? parsedString =
        parse(document.body?.text).documentElement?.text;

    return parsedString ?? "";
  }
}
