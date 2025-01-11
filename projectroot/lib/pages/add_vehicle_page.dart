import 'package:flutter/material.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  List<int> vehicleList = [];

  void _addVehicleCard() {
    setState(() {
      vehicleList.add(vehicleList.length + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu, color: Colors.white),
            Column(
              children: [
                Text(
                  'Quantidade de veículos\n${vehicleList.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  'Resultado Faturamento Líquido\n+ 20% = R\$ ${vehicleList.length * 30}K',
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(color: Colors.greenAccent, fontSize: 12),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: _addVehicleCard,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: vehicleList.isEmpty
              ? const Center(
                  child: Text(
                    'Nenhum veículo adicionado.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: vehicleList.length,
                  itemBuilder: (context, index) {
                    return VehicleCard(vehicleNumber: vehicleList[index]);
                  },
                ),
        ),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final int vehicleNumber;

  const VehicleCard({required this.vehicleNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text(
                      'Foto\nVeículo',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Modelo $vehicleNumber',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Faturamento'),
                              Text('R\$ 15.000'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Custos'),
                              Text('R\$ 10.000'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Próxima Revisão'),
                              Text('Trocar óleo: 12k km'),
                              Text('Trocar Pneu: 10k km'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
