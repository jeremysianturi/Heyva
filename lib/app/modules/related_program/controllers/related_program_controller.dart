import 'package:get/get.dart';
import 'package:heyva/app/modules/related_program/model/program_model.dart';

class RelatedProgramController extends GetxController {
  var listProgram = <ProgramModel>[].obs;
  var switchbutton = false.obs;

  @override
  void onInit() {
    initDummyData();
    super.onInit();
  }

  initDummyData() {
    listProgram.addAll([
      ProgramModel(name: "All Program", isSelected: true.obs),
      ProgramModel(name: "Mental Health", isSelected: false.obs),
      ProgramModel(name: "Pelvic Floor", isSelected: false.obs),
      ProgramModel(name: "Feeding", isSelected: false.obs),
      ProgramModel(name: "Pospatrum", isSelected: false.obs),
    ]);
  }

  ontapProgramsTab({required int index}) {
    listProgram.firstWhereOrNull((e) => e.isSelected.isTrue)?.isSelected.value =
        false;
    listProgram[index].isSelected.value = true;
    listProgram.refresh();
  }
}
