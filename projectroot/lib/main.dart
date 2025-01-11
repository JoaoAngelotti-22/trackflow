import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/', // Define a rota inicial como LoginPage
      routes: {
        '/': (context) => const LoginPage(), // Rota para a tela de login
        '/register': (context) =>
            const RegisterPage(), // Rota para a tela de cadastro
        '/home': (context) => const HomePage(), // Rota para a tela HomePage
      },
    );
  }
}
