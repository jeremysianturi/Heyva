import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:heyva/app/modules/breathing_exercise/breathing_finish/bindings/breathing_finish_binding.dart';
import 'package:heyva/app/modules/breathing_exercise/breathing_finish/views/breathing_finish_view.dart';

import '../modules/article/bindings/article_binding.dart';
import '../modules/article/views/article_view.dart';
import '../modules/breast_feeding/bindings/breast_feeding_binding.dart';
import '../modules/breast_feeding/views/breast_feeding_view.dart';
import '../modules/breathing/breathingone/bindings/breathing_one_binding.dart';
import '../modules/breathing/breathingone/views/breathing_one_view.dart';
import '../modules/breathing/breathingtimer/bindings/breathing_timer_binding.dart';
import '../modules/breathing/breathingtimer/views/breathing_timer_view.dart';
import '../modules/breathing/breathingtwo/bindings/breathing_two_binding.dart';
import '../modules/breathing/breathingtwo/views/breathing_two_view.dart';
import '../modules/breathing_exercise/bindings/breathing_exercise_binding.dart';
import '../modules/breathing_exercise/breathin_voice/bindings/breathin_voice_binding.dart';
import '../modules/breathing_exercise/breathin_voice/views/breathin_voice_view.dart';
import '../modules/breathing_exercise/breathing_feelings/bindings/breathing_feelings_binding.dart';
import '../modules/breathing_exercise/breathing_feelings/views/breathing_feelings_view.dart';
import '../modules/breathing_exercise/views/breathing_exercise_view.dart';
import '../modules/detaildoctor/bindings/detail_doctor_binding.dart';
import '../modules/detaildoctor/views/detail_doctor_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/bindings/login_google_apple_binding.dart';
import '../modules/login/views/login_google_apple.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mood_tracker/bindings/mood_tracker_binding.dart';
import '../modules/mood_tracker/mood_tracker_form/bindings/mood_tracker_form_binding.dart';
import '../modules/mood_tracker/mood_tracker_form/views/mood_tracker_form_view.dart';
import '../modules/mood_tracker/recomendation/bindings/recomendation_binding.dart';
import '../modules/mood_tracker/recomendation/views/recomendation_view.dart';
import '../modules/mood_tracker/recomendation2/bindings/recomendation2_binding.dart';
import '../modules/mood_tracker/recomendation2/views/recomendation2_view.dart';
import '../modules/mood_tracker/sleep_check-in/bindings/sleep_check_in_binding.dart';
import '../modules/mood_tracker/sleep_check-in/views/sleep_check_in_view.dart';
import '../modules/mood_tracker/views/mood_tracker_view.dart';
import '../modules/onboarding/bindings/onboarding_one_binding.dart';
import '../modules/onboarding/bindings/onboarding_three_binding.dart';
import '../modules/onboarding/bindings/onboarding_two_binding.dart';
import '../modules/onboarding/bindings/onplanning/onplanning_one_binding.dart';
import '../modules/onboarding/bindings/turnon_notif/turnon_notif_binding.dart';
import '../modules/onboarding/views/onboarding_one_view.dart';
import '../modules/onboarding/views/onboarding_three_view.dart';
import '../modules/onboarding/views/onboarding_two_view.dart';
import '../modules/onboarding/views/onplanning/onplanning_one_view.dart';
import '../modules/onboarding/views/turnon_notif/turnon_notif_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/related_program/bindings/related_program_binding.dart';
import '../modules/related_program/views/related_program_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.rHOME;
  static const INITIAL = Routes.SIGNUP;

  static final routes = [
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_GOOGLE_APPLE,
      page: () => LoginGoogleAppleView(),
      binding: LoginGoogleAppleBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_ONE,
      page: () => OnBoardingOneView(),
      binding: OnBoardingOneBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_TWO,
      page: () => OnBoardingTwoView(),
      binding: OnBoardingTwoBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_THREE,
      page: () => OnBoardingThreeView(),
      binding: OnBoardingThreeBinding(),
    ),
    GetPage(
      name: _Paths.ONPLANNING_ONE,
      page: () => OnPlanningOneView(),
      binding: OnPlanningOneBinding(),
    ),
    GetPage(
      name: _Paths.TURNON_NOTIF,
      page: () => TurnOnNotifView(),
      binding: TurnOnNotifBinding(),
    ),
    GetPage(
      name: _Paths.BREATHING_ONE,
      page: () => BreathingOneView(),
      binding: BreathingOneBinding(),
    ),
    GetPage(
      name: _Paths.BREATHING_TWO,
      page: () => BreathingTwoView(),
      binding: BreathingTwoBinding(),
    ),
    GetPage(
      name: _Paths.BREATHING_TIMER,
      page: () => BreathingTimerView(),
      binding: BreathingTimerBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_DOCTOR,
      page: () => DetailDoctorView(),
      binding: DetailDoctorBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.BREAST_FEEDING,
      page: () => BreastFeedingView(),
      binding: BreastFeedingBinding(),
    ),
    GetPage(
      name: _Paths.MOOD_TRACKER,
      page: () => const MoodTrackerView(),
      binding: MoodTrackerBinding(),
    ),
    GetPage(
      name: _Paths.MOOD_TRACKER_FORM,
      page: () => MoodTrackerFormView(),
      binding: MoodTrackerFormBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP_CHECK_IN,
      page: () => const SleepCheckInView(),
      binding: SleepCheckInBinding(),
    ),
    GetPage(
      name: _Paths.RECOMENDATION,
      page: () => const RecomendationView(),
      binding: RecomendationBinding(),
    ),
    GetPage(
      name: _Paths.RECOMENDATION2,
      page: () => const Recomendation2View(),
      binding: Recomendation2Binding(),
    ),
    GetPage(
      name: _Paths.RELATED_PROGRAM,
      page: () => const RelatedProgramView(),
      binding: RelatedProgramBinding(),
    ),
    GetPage(
      name: _Paths.BREATHING_EXERCISE,
      page: () => const BreathingExerciseView(),
      binding: BreathingExerciseBinding(),
    ),
    GetPage(
      name: _Paths.BREATHIN_VOICE,
      page: () => const BreathinVoiceView(),
      binding: BreathinVoiceBinding(),
    ),
    GetPage(
      name: _Paths.BREATHING_FEELINGS,
      page: () => const BreathingFeelingsView(),
      binding: BreathingFeelingsBinding(),
    ),
    GetPage(
      name: _Paths.BREATHING_FINISH,
      page: () => const BreathingFinishView(),
      binding: BreathingFinishBinding(),
    ),
  ];
}
