import 'package:flutter/material.dart';
import 'add_vehicle_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento de veiculo'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddVehiclePage()),
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
            Text('Total de veiculos: 0'),
            Text('Total Gasto: \$0'),
            Text('Receita total: \$0'),
            Text('Resultado geral: 0%'),
          ],
        ),
      ),
    );
  }
}
