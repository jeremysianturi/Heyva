import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart';
import 'package:heyva/app/modules/related_program/model/content_list_model.dart'
    as content;
import 'package:heyva/app/modules/related_program/model/tags_model.dart'
    as tags;
import 'package:heyva/app/modules/related_program/provider/related_program_provider.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/services/dio_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RelatedProgramController extends GetxController {
  // var listProgram = <ProgramModel>[].obs;
  var switchbutton = false.obs;
  dynamic argumentData = Get.arguments;
  var sendedTagId = "";
  final ScrollController scrollController = ScrollController();
  RefreshController refreshC = RefreshController(initialRefresh: false);
  RefreshController staggertRefreshC = RefreshController(initialRefresh: false);

  getArguments() {
    if (argumentData != null) {
      sendedTagId = argumentData[Keys.learnTagId].toString();
      onArgumentTags(id: sendedTagId);
    } else {
      getListContent(tags: "", isInit: true);
    }
  }

  @override
  void onInit() {
    _client = RefreshDioClient();
    _programProvider = RelatedProgramProvider(_client.init());
    getTagList();

    super.onInit();
  }

  onArgumentTags({required String id}) {
    tagList.firstWhereOrNull((e) => e.isSelected == true)?.isSelected = false;
    tagList.firstWhereOrNull((e) => e.id == id)?.isSelected = true;
    var index = tagList.indexWhere((e) => e.id == id);
    tagList.refresh();
    scrollController.jumpTo(index * (Get.width / 4));

    getListContent(tags: id);
  }

  String get selectedTag {
    return tagList.firstWhereOrNull((e) => e.isSelected == true)?.id ?? "";
  }

  ontapProgramsTab({required int index}) {
    tagList.firstWhereOrNull((e) => e.isSelected == true)?.isSelected = false;
    tagList[index].isSelected = true;
    tagList.refresh();
    page.value = 1;
    listContent.clear();
    getListContent(tags: selectedTag, isInit: true, isRefresh: true);
  }

  var isLoading = false.obs;
  late RefreshDioClient _client;
  late RelatedProgramProvider _programProvider;
  var errorMessage = ''.obs;
  var isEmailError = false.obs;
  var isPasserror = false.obs;
  var isSelectedTab = "".obs;

  int get programCount {
    var data = contentListResponse.value.count ?? 0;
    debugPrint("content response $data");
    if (data == 0) {
      return listContent.length;
    } else {
      return data;
    }
  }

  var contentListResponse =
      ContentListModel(success: "", data: null, message: "", error: "").obs;

  var listContent = <content.Data>[].obs;
  var page = 1.obs;

  getListContent({required tags, isRefresh = false, isInit = false}) async {
    errorMessage.value = "";
    isLoading.value = isInit;
    try {
      contentListResponse.value = (await _programProvider.getContentList(
          tagId: tags, page: page.value.toString()))!;
      Future.delayed(1.seconds, () {
        isLoading.value = false;
        refreshC.refreshCompleted();
        refreshC.loadComplete();
        staggertRefreshC.refreshCompleted();
        staggertRefreshC.loadComplete();
      });

      if (contentListResponse.value.success == "Success") {
        if (isRefresh) {
          listContent.assignAll(contentListResponse.value.data as List<Data>);
        } else {
          listContent.addAll(contentListResponse.value.data as List<Data>);
        }
        page++;
      } else {
        errorMessage.value =
            contentListResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;
      refreshC.refreshCompleted();
      refreshC.loadComplete();
      staggertRefreshC.refreshCompleted();
      staggertRefreshC.loadComplete();
      debugPrint("error ---  $e");
    }
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
        getArguments();
      } else {
        errorMessage.value = tagListResponse.value.message ?? "Error Message";
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint("error  $e");
    }
  }

  onLoad() {
    getListContent(tags: selectedTag);
  }

  onRefresh() {
    page.value = 1;
    getListContent(tags: selectedTag, isRefresh: true);
  }
}
