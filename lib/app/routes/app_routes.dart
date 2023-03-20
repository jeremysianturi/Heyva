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
}