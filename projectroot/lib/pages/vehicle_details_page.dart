import 'package:flutter/material.dart';

class VehicleDetailsPage extends StatelessWidget {
  const VehicleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Veículo'),
      ),
      body: const Center(
        child: Text('Página de Detalhes do Veículo'),
      ),
    );
  }
}
