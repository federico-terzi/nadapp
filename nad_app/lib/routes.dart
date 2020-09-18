import 'package:flutter/widgets.dart';
import 'package:nad_app/screens/diary/diary_screen.dart';
import 'package:nad_app/screens/home/home_screen.dart';
import 'package:nad_app/screens/intro/intro_screen.dart';
import 'package:nad_app/screens/login/login_screen.dart';
import 'package:nad_app/screens/patient_check/patient_check_screen.dart';
import 'package:page_transition/page_transition.dart';

const INTRO_ROUTE = "/intro";
const PATIENT_CHECK_ROUTE = "/patientCheck";
const LOGIN_ROUTE = "/login";
const HOME_ROUTE = "/home";
const DIARY_ROUTE = "/diary";

PageTransition<dynamic> routeFactory(RouteSettings settings) {
  switch (settings.name) {
    case INTRO_ROUTE:
      return PageTransition(child: IntroScreen(), type: PageTransitionType.rightToLeft);
      break;
    case PATIENT_CHECK_ROUTE:
      return PageTransition(child: PatientCheckScreen(), type: PageTransitionType.rightToLeft);
      break;
    case LOGIN_ROUTE:
      return PageTransition(child: LoginScreen(), type: PageTransitionType.rightToLeft);
      break;
    case HOME_ROUTE:
      return PageTransition(child: HomeScreen(), type: PageTransitionType.fade);
      break;
    case DIARY_ROUTE:
      return PageTransition(child: DiaryScreen(), type: PageTransitionType.rightToLeft);
      break;
    default:
      return null;
  }
}