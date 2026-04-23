import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/navigation/navigation.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Posts app',
      routerConfig: router,
      theme: ThemeData(colorSchemeSeed: const Color(0xFF006064)),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF006064),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
    );
  }
}
