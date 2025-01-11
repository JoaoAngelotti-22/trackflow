import 'package:flutter/material.dart';
import 'add_vehicle_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento de Veículos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddVehiclePage(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Total de veículos: 0'),
            Text('Total Gasto: R\$ 0'),
            Text('Receita total: R\$ 0'),
            Text('Resultado geral: 0%'),
          ],
        ),
      ),
    );
  }
}
