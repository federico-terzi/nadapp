import 'package:flutter/widgets.dart';
import 'package:nad_app/screens/add_balance/add_balance_screen.dart';
import 'package:nad_app/screens/add_balance/add_balance_tips_screen.dart';
import 'package:nad_app/screens/add_meal/add_meal_screen.dart';
import 'package:nad_app/screens/add_meal/add_meal_tips_screen.dart';
import 'package:nad_app/screens/balance/balance_screen.dart';
import 'package:nad_app/screens/contact/contact_screen.dart';
import 'package:nad_app/screens/diary/diary_screen.dart';
import 'package:nad_app/screens/home/home_screen.dart';
import 'package:nad_app/screens/init/init_screen.dart';
import 'package:nad_app/screens/intro/intro_screen.dart';
import 'package:nad_app/screens/login/login_screen.dart';
import 'package:nad_app/screens/my_doctors/my_doctors_screen.dart';
import 'package:nad_app/screens/patient_check/patient_check_screen.dart';
import 'package:nad_app/screens/reports/reports_screen.dart';
import 'package:nad_app/screens/useful_information/iicb_screen.dart';
import 'package:nad_app/screens/useful_information/iicb_therapy_screen.dart';
import 'package:nad_app/screens/useful_information/useful_information_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'models/balance.dart';

const INIT_ROUTE = "/init";
const INTRO_ROUTE = "/intro";
const PATIENT_CHECK_ROUTE = "/patientCheck";
const LOGIN_ROUTE = "/login";
const HOME_ROUTE = "/home";
const DIARY_ROUTE = "/diary";
const ADD_MEAL_ROUTE = "/addMeal";
const ADD_MEAL_TIPS_ROUTE = "/addMealTips";
const BALANCE_ROUTE = "/balance";
const ADD_BALANCE_ROUTE = "/addBalance";
const ADD_BALANCE_TIPS_ROUTE = "/addBalanceTips";
const REPORTS_ROUTE = "/reports";
const CONTACT_ROUTE = "/contact";
const MY_DOCTORS_ROUTE = "/myDoctors";
const USEFUL_INFORMATION_ROUTE = "/usefulInfo";
const USEFUL_INFORMATION_IICB_ROUTE = "/usefulInfoIICB";
const USEFUL_INFORMATION_IICB_THERAPY_ROUTE = "/usefulInfoIICBTherapy";

PageTransition<dynamic> routeFactory(RouteSettings settings) {
  switch (settings.name) {
    case INIT_ROUTE:
      return PageTransition(child: InitScreen(), type: PageTransitionType.fade);
      break;
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
    case ADD_MEAL_ROUTE:
      return PageTransition(child: AddMealScreen(), type: PageTransitionType.rightToLeft);
      break;
    case ADD_MEAL_TIPS_ROUTE:
      return PageTransition(child: AddMealTipsScreen(), type: PageTransitionType.rightToLeft);
      break;
    case BALANCE_ROUTE:
      return PageTransition(child: BalanceScreen(), type: PageTransitionType.rightToLeft);
      break;
    case ADD_BALANCE_ROUTE:
      Balance balance = settings.arguments;
      return PageTransition(child: AddBalanceScreen(balance), type: PageTransitionType.rightToLeft);
      break;
    case ADD_BALANCE_TIPS_ROUTE:
      return PageTransition(child: AddBalanceTipsScreen(), type: PageTransitionType.rightToLeft);
      break;
    case CONTACT_ROUTE:
      return PageTransition(child: ContactScreen(), type: PageTransitionType.rightToLeft);
      break;
    case MY_DOCTORS_ROUTE:
      return PageTransition(child: MyDoctorsScreen(), type: PageTransitionType.rightToLeft);
      break;
    case REPORTS_ROUTE:
      return PageTransition(child: ReportsScreen(), type: PageTransitionType.rightToLeft);
      break;
    case USEFUL_INFORMATION_ROUTE:
      return PageTransition(child: UsefulInformationScreen(), type: PageTransitionType.rightToLeft);
      break;
    case USEFUL_INFORMATION_IICB_ROUTE:
      return PageTransition(child: UsefulInformationIICBScreen(), type: PageTransitionType.rightToLeft);
      break;
    case USEFUL_INFORMATION_IICB_THERAPY_ROUTE:
      return PageTransition(child: UsefulInformationIICBTherapyScreen(), type: PageTransitionType.rightToLeft);
      break;
    default:
      return null;
  }
}