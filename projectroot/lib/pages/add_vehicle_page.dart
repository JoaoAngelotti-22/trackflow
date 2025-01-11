import 'package:flutter/material.dart';

class AddVehiclePage extends StatelessWidget {
  const AddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Veiculo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Tipo do Veiculo'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Placa do veiculo'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Modelo do Veiculo'),
            ),
            TextField(
              decoration:
                  const InputDecoration(labelText: 'Quilometragem (Km)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
