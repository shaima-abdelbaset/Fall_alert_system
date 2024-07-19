import 'package:fall_detection/feature/ChatScreen/presentation/view/chattingview.dart';
import 'package:fall_detection/feature/auth/presentation/views/OnBoarding3_view.dart';
import 'package:fall_detection/feature/auth/presentation/views/OnBoarding_view.dart';
import 'package:fall_detection/feature/auth/presentation/views/forgotPassword.dart';
import 'package:fall_detection/feature/auth/presentation/views/login_view.dart';
import 'package:fall_detection/feature/auth/presentation/views/signup_view.dart';
import 'package:fall_detection/feature/messages/presentation/view/chat_view.dart';
import 'package:fall_detection/feature/home/presenation/views/bottom_nav_bar.dart';
import 'package:fall_detection/feature/home/presenation/views/home_view.dart';
import 'package:fall_detection/feature/map/presentation/views/map_screen.dart';
import 'package:fall_detection/feature/notification/presentation/views/notification_view.dart';
import 'package:fall_detection/feature/patient/presentation/views/patient_view.dart';
import 'package:fall_detection/feature/profile/presenation/profile_screen.dart';
import 'package:fall_detection/feature/splash/presentation/views/splashScreen.dart';

import '../../feature/auth/presentation/views/activate_user_screen.dart';
import '../../feature/auth/presentation/views/onBoaring2_view.dart';
import '../../feature/auth/presentation/views/resetPassword.dart';
import '../../feature/auth/presentation/views/resetPasswordDone.dart';
import '../../feature/auth/presentation/views/resetPassword_code.dart';
import './routes.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.onBoardingScreen2:
        return MaterialPageRoute(
          builder: (_) => const onBoaringScreen2(),
        );
      case Routes.onBoardingScreen3:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView3(),
        );
      case Routes.sighupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.loginInScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBar(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.patientScreen:
        return MaterialPageRoute(
          builder: (_) => const PatientScreen(),
        );
      case Routes.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case Routes.MessageScareen:
        return MaterialPageRoute(
          builder: (_) => const MessageView(),
        );
      case Routes.mapScreen:
        return MaterialPageRoute(
          builder: (_) => const MapScreen(),
        );

      case Routes.ChatView:
        return MaterialPageRoute(
          builder: (_) => const ChatView(),
        );

      case Routes.activateUsrAccount:
        return MaterialPageRoute(
          builder: (_) => const ActivateUserAccount(),
        );
      case Routes.mapScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => forgotPassword(),
        );
      case Routes.resetPasswordCode:
        return MaterialPageRoute(
          builder: (_) => const ResetpasswordCode(),
        );

      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => resetPassword(),
        );
      case Routes.resetPasswordDone:
        return MaterialPageRoute(
          builder: (_) => const Resetpassworddone(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No Routes defiend for ${setting.name}',
              ),
            ),
          ),
        );
    }
  }
}
