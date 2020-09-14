import 'package:flutter/widgets.dart';
import 'package:nad_app/screens/intro/intro_screen.dart';
import 'package:nad_app/screens/login/login_screen.dart';
import 'package:nad_app/screens/patient_check/patient_check_screen.dart';
import 'package:page_transition/page_transition.dart';

PageTransition<dynamic> routeFactory(RouteSettings settings) {
  switch (settings.name) {
    case '/intro':
      return PageTransition(child: IntroScreen(), type: PageTransitionType.rightToLeft);
      break;
    case '/patientCheck':
      return PageTransition(child: PatientCheckScreen(), type: PageTransitionType.rightToLeft);
      break;
    case '/login':
      return PageTransition(child: LoginScreen(), type: PageTransitionType.rightToLeft);
      break;
    default:
      return null;
  }
}
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/intro": (BuildContext context) => IntroScreen(),
  "/patientCheck": (BuildContext context) => IntroScreen(),
};