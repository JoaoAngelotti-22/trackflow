import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/add_vehicle_page.dart'; // Importação da página de adicionar veículo
import 'pages/vehicle_details_page.dart'; // Importação da página de detalhes do veículo
import 'pages/dashboards.dart'; // Importação da página de Dashboards
import 'pages/Assinatura.dart'; // Importação da página de Assinatura

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrackGo', // Ajustado para refletir o nome do app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      initialRoute: '/', // Define a rota inicial como a tela de login
      routes: {
        '/': (context) => const LoginPage(), // Tela de Login
        '/register': (context) => const RegisterPage(), // Tela de Cadastro
        '/home': (context) => const HomePage(), // Tela Principal (Home)
        '/addVehicle': (context) =>
            const AddVehiclePage(), // Tela de Adicionar Veículo
        '/vehicleDetails': (context) =>
            const VehicleDetailsPage(), // Tela de Detalhes do Veículo
        '/dashboards': (context) =>
            const DashboardsPage(), // Tela de Dashboards
        '/assinatura': (context) =>
            const Assinatura(), // Tela de Assinatura Eletrônica
      },
    );
  }
}
