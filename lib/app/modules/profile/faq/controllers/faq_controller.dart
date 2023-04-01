import 'package:get/get.dart';
import 'package:heyva/app/modules/profile/privacy_policy/model/privacy_policy_model.dart';
import 'package:heyva/constant/strings.dart';

class FaqController extends GetxController {
  var list = <PrivacyPolicyModel>[
    PrivacyPolicyModel(
        title: 'What information do we collect about you?',
        subTitle: Strings.dummy_doctordetail_text,
        isSelected: RxBool(false)),
    PrivacyPolicyModel(
        title: 'What information do we collect about you?',
        subTitle: Strings.dummy_doctordetail_text,
        isSelected: RxBool(false)),
    PrivacyPolicyModel(
        title: 'What information do we collect about you?',
        subTitle: Strings.dummy_doctordetail_text,
        isSelected: RxBool(false)),
  ].obs;
}
