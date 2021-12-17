import 'package:get/get.dart';
import 'package:toffee_ride/features/accounts/accounts.dart';
import 'package:toffee_ride/features/home/home.dart';
import 'package:toffee_ride/features/jithu/Lesson/lesson.dart';
import 'package:toffee_ride/features/jithu/fill_quiz/quiz_screen.dart';
import 'package:toffee_ride/features/jithu/match_the_following/match_the_following.dart';
import 'package:toffee_ride/features/login/login.dart';
import 'package:toffee_ride/features/onboarding/onboarding.dart';
import 'package:toffee_ride/features/otp/otp.dart';
import 'package:toffee_ride/features/parent/parent.dart';
import 'package:toffee_ride/features/registration/registration.dart';
import 'package:toffee_ride/features/splash/splash.dart';
import 'package:toffee_ride/features/subject/subject.dart';
import 'package:toffee_ride/features/view_contents/view_contents.dart';

List<GetPage> routes() => [
      GetPage(name: "/", page: () => const SplashScreen()),
      GetPage(name: "/onboard", page: () => const OnboardingScreen()),
      GetPage(name: "/login", page: () => const LoginScreen()),
      GetPage(name: "/registration", page: () => const RegistrationScreen()),
      GetPage(name: "/login_otp", page: () => const OtpScreen()),
      GetPage(name: "/accounts", page: () => const AccountScreen()),
      GetPage(name: "/home", page: () => const HomeScreen()),
      GetPage(name: "/parent", page: () => const ParentScreen()),
      GetPage(name: "/view_contents", page: () => const ViewContentsScreen()),
      GetPage(name: "/subject_details", page: () => const SubjectScreen()),
      GetPage(name: "/fill_in_the_blanks", page: () => FillInTheBlanks()),
      GetPage(
          name: "/match_the_following", page: () => const MatchTheFollowing()),
      GetPage(name: "/lesson_page", page: () => const LessonPage()),
    ];
