import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secret_box/firebase_options.dart';
import 'package:secret_box/widgets/audios.dart';
import 'package:secret_box/widgets/authScreen.dart';
import 'package:secret_box/widgets/check_email.dart';
import 'package:secret_box/widgets/cloud_page.dart';
import 'package:secret_box/widgets/contacts.dart';
import 'package:secret_box/widgets/documents.dart';
import 'package:secret_box/widgets/files_page.dart';
import 'package:secret_box/widgets/folders.dart';
import 'package:secret_box/widgets/forgot_password.dart';
import 'package:secret_box/widgets/home_page.dart';
import 'package:secret_box/widgets/music.dart';
import 'package:secret_box/widgets/photos.dart';
import 'package:secret_box/widgets/plan_page.dart';
import 'package:secret_box/widgets/pro_user_page.dart';
import 'package:secret_box/widgets/secret_web_page.dart';
import 'package:secret_box/widgets/security_pin.dart';
import 'package:secret_box/widgets/set_new_password.dart';
import 'package:secret_box/widgets/sign_up.dart';
import 'package:secret_box/widgets/videos.dart';

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
      initialRoute: '/files',
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
        
      },
    );
  }
}
