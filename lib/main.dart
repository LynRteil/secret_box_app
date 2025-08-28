import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secret_box/firebase_options.dart';
import 'package:secret_box/screens/dashboard.dart';
import 'package:secret_box/screens/audios.dart';
import 'package:secret_box/screens/authScreen.dart';
import 'package:secret_box/screens/check_email.dart';
import 'package:secret_box/screens/cloud_page.dart';
import 'package:secret_box/screens/contacts.dart';
import 'package:secret_box/screens/documents.dart';
import 'package:secret_box/screens/files_page.dart';
import 'package:secret_box/screens/folders.dart';
import 'package:secret_box/screens/forgot_password.dart';
import 'package:secret_box/screens/home_page.dart';
import 'package:secret_box/screens/music.dart';
import 'package:secret_box/screens/photos.dart';
import 'package:secret_box/screens/plan_page.dart';
import 'package:secret_box/screens/pro_user_page.dart';
import 'package:secret_box/screens/secret_web_page.dart';
import 'package:secret_box/screens/security_pin.dart';
import 'package:secret_box/screens/set_new_password.dart';
import 'package:secret_box/screens/sign_up.dart';
import 'package:secret_box/screens/videos.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/files': (context) => const FilesPage(),
        '/secretWeb': (context) => const SecretWebPage(),
        '/cloud': (context) => const CloudPage(),
        '/proUser': (context) => const ProUserPage(),
        '/home': (context) => const HomePage(),
        '/plan': (context) => const PlanPage(),
        '/authScreen': (context) => const Authscreen(),
        '/signup': (context) => const SignUp(),
        '/securitypin': (context) => const SecurityPin(),
        '/documents': (context) => const Documents(),
        '/photos': (context) => const Photos(),
        '/videos': (context) => const Videos(),
        '/contacts': (context) => const Contacts(),
        '/music': (context) => const Music(),
        '/audios': (context) => const Audios(),
        '/folders': (context) => const Folders(),
        '/forgot-password':(context)=>const ForgotPassword(),
        '/checkemail':(context)=>const CheckEmail(),
        '/setnewpassword':(context)=>const SetNewPassword(),
        '/setDashboard':(context)=>const Dashboard(),
        
      },
    );
  }
}
