import 'package:elaro/core/services/dependancy_injection_instance.dart';
import 'package:elaro/features/main/view/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Elaro",
      home: MainPage(),
    );
  }
}
