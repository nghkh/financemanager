import 'package:get/get.dart';

import '../../pages/intro/intro_screen.dart';
import '../../pages/login_signup/controller/controller_login.dart';
import '../../pages/login_signup/controller/controller_signup.dart';
import '../../pages/login_signup/login_page.dart';
import '../../pages/login_signup/sign_up_page.dart';
import '../../pages/overview_pages/controller/tab_controller.dart';
import '../../pages/overview_pages/overview.dart';
import '../../pages/profile_basic_info.dart';
import '../../pages/profile_page.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: '/',
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUpPage(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: '/intro',
          page: () => const IntroScreen(),
        ),
        GetPage(
          name: '/overview',
          page: () => const Overview(),
          binding: TabBinding(),
        ),
        GetPage(
          name: '/profile_info',
          page: () => const ProfileInfo(),
        ),
        GetPage(
          name: '/profile_page',
          page: (() => const ProfilePage()),
        ),
      ];
}