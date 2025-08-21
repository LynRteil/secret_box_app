import 'package:flutter/material.dart';
import 'package:secret_box/widgets/cloud_page.dart';
import 'package:secret_box/widgets/files_page.dart';
import 'package:secret_box/widgets/pro_user_page.dart';
import 'package:secret_box/widgets/secret_web_page.dart';

void main() {
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
      },
    );
  }
}
