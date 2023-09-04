import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesis_v2_app/presentation/providers/auth/auth_service_provider.dart';
import 'presentation/screens/screens.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthServiceProvider(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi app de flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
