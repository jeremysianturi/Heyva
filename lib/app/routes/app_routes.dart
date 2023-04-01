part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SIGNUP = _Paths.SIGNUP;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const LOGIN_GOOGLE_APPLE = _Paths.LOGIN_GOOGLE_APPLE;
  static const ONBOARDING_ONE = _Paths.ONBOARDING_ONE;
  static const ONBOARDING_TWO = _Paths.ONBOARDING_TWO;
  static const ONBOARDING_THREE = _Paths.ONBOARDING_THREE;
  static const ONPLANNING_ONE = _Paths.ONPLANNING_ONE;
  static const TURNON_NOTIF = _Paths.TURNON_NOTIF;
  static const BREATHING_ONE = _Paths.BREATHING_ONE;
  static const BREATHING_TWO = _Paths.BREATHING_TWO;
  static const BREATHING_TIMER = _Paths.BREATHING_TIMER;
  static const DETAIL_DOCTOR = _Paths.DETAIL_DOCTOR;
  static const ARTICLE = _Paths.ARTICLE;
  static const BREAST_FEEDING = _Paths.BREAST_FEEDING;
  static const MOOD_TRACKER = _Paths.MOOD_TRACKER;
  static const MOOD_TRACKER_FORM = _Paths.MOOD_TRACKER_FORM;
  static const SLEEP_CHECK_IN = _Paths.SLEEP_CHECK_IN;
  static const RECOMENDATION = _Paths.RECOMENDATION;
  static const RECOMENDATION2 = _Paths.RECOMENDATION2;
  static const RELATED_PROGRAM = _Paths.RELATED_PROGRAM;
  static const BREATHING_EXERCISE = _Paths.BREATHING_EXERCISE;
  static const BREATHIN_VOICE = _Paths.BREATHIN_VOICE;
  static const BREATHING_FEELINGS = _Paths.BREATHING_FEELINGS;
  static const BREATHING_FINISH = _Paths.BREATHING_FINISH;
  static const PROFILE = _Paths.PROFILE;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const CHANGE_PASSWORD = _Paths.CHANGE_PASSWORD;
  static const NOTIFICATION_SETTINGS = _Paths.NOTIFICATION_SETTINGS;
  static const PRIVACY_POLICY = _Paths.PRIVACY_POLICY;
  static const FAQ = _Paths.FAQ;
}

abstract class _Paths {
  _Paths._();

  static const SIGNUP = '/signup';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const LOGIN_GOOGLE_APPLE = '/loginGoogleApple';
  static const ONBOARDING_ONE = '/onBoardingOne';
  static const ONBOARDING_TWO = '/onBoardingTwo';
  static const ONBOARDING_THREE = '/onBoardingThree';
  static const ONPLANNING_ONE = '/onPlanningOne';
  static const TURNON_NOTIF = '/turnOnNotif';
  static const BREATHING_ONE = '/BreathingOne';
  static const BREATHING_TWO = '/BreathingTwo';
  static const BREATHING_TIMER = '/BreathingTimer';
  static const DETAIL_DOCTOR = '/detailDoctor';
  static const ARTICLE = '/article';
  static const BREAST_FEEDING = '/breast_feeding';
  static const MOOD_TRACKER = '/mood-tracker';
  static const MOOD_TRACKER_FORM = '/mood-tracker-form';
  static const SLEEP_CHECK_IN = '/sleep-check-in';
  static const RECOMENDATION = '/recomendation';
  static const RECOMENDATION2 = '/recomendation2';
  static const RELATED_PROGRAM = '/related-program';
  static const BREATHING_EXERCISE = '/breathing-exercise';
  static const BREATHIN_VOICE = '/breathin-voice';
  static const BREATHING_FEELINGS = '/breathing-feelings';
  static const BREATHING_FINISH = '/breathing-finish';
  static const PROFILE = '/profile';
  static const EDIT_PROFILE = '/edit-profile';
  static const CHANGE_PASSWORD = '/change-password';
  static const NOTIFICATION_SETTINGS = '/notification-settings';
  static const PRIVACY_POLICY = '/privacy-policy';
  static const FAQ = '/faq';
}
