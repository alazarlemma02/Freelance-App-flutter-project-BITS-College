import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/add_job_page.dart';
import 'package:sira/view/screens/applicant_profile_page.dart';
import 'package:sira/view/screens/avilable_jobs_page.dart';
import 'package:sira/view/screens/category_page.dart';
import 'package:sira/view/screens/edit_profile_page.dart';
import 'package:sira/view/screens/job_application_page.dart';
import 'package:sira/view/screens/job_detail_page.dart';
import 'package:sira/view/screens/login_page.dart';
import 'package:sira/view/screens/my_profile.dart';
import 'package:sira/view/screens/ongoing_jobs_page.dart';
import 'package:sira/view/screens/path_page.dart';
import 'package:sira/view/screens/posted_jobs_page.dart';
import 'package:sira/view/screens/signup_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('am', "ETH"),
    ],
    path: 'assets/translations',
    saveLocale: true,
    fallbackLocale: Locale('en', 'US'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/SignUpPage': (context) => const SignUpPage(),
        '/CategoryPage': (context) => const PathPage(),
        '/PostedJobs': (context) => const PostedJobs(),
        '/AddJobPage': (context) => const AddJob(),
        '/JobDetailPage': (context) => const JobDetailPage(),
        '/ApplicantProfilePage': (context) => const Applicantprofile(),
        '/AvailableJobs': (context) => const AvailableJobs(),
        '/JobApplicationpage': (context) => const JobApplicationpage(),
        '/OngoingJobs': (context) => const OngoingJobs(),
        '/MyProfilePage': (context) => const My_profile(),
        '/EditProfilePage': (context) => const EditProfilePage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: CustomColors.blackTextColor),
        drawerTheme: DrawerThemeData(
          backgroundColor: CustomColors.backgroundColor,
        ),
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.transparentColor,
          elevation: 0,
          foregroundColor: CustomColors.blackTextColor,
          toolbarHeight: 70,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: CustomColors.buttonBlueColor,
        ),
        primaryColor: CustomColors.buttonBlueColor,
        fontFamily: 'OpenSans',
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
