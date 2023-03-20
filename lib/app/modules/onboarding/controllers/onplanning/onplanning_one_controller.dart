import 'package:get/get.dart';
import '../../../../../model/interest.dart';

class OnPlanningOneController extends GetxController {
  List<Interest> list = [
  Interest(subject: "Newborn Baby Care",isSelected: false.obs),
  Interest(subject: "Postpartum",isSelected: false.obs),
  Interest(subject: "Feeding",isSelected: false.obs),
  Interest(subject: "Mental Health",isSelected: false.obs),
  Interest(subject: "Body Recovery",isSelected: false.obs),
  Interest(subject: "Pelvic Health",isSelected: false.obs),
  Interest(subject: "Balance Life",isSelected: false.obs),
  Interest(subject: "Caring for baby",isSelected: false.obs),
  Interest(subject: "Emotional Support and Recovery",isSelected: false.obs),
  Interest(subject: "Breastfeeding",isSelected: false.obs),
  Interest(subject: "Connect with other Moms",isSelected: false.obs),
  ];
  RxBool isVisible = true.obs;
  RxInt selectedBtnRemaining = 0.obs;

  void showButton() {
    isVisible.value = true;
  }

  void hideContainer() {
    isVisible.value = false;
  }

  void anyButtonStillSelected(String whatToDo){
    if(whatToDo == "plus"){
      selectedBtnRemaining += 1;
    } else {
      selectedBtnRemaining -= 1;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // List.generate(8, (index) => list.add(Interest(subject: 'No',isSelected: false.obs),),);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
