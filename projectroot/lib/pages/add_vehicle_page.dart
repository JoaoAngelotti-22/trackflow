import 'package:flutter/material.dart';

// Página para adicionar e visualizar veículos
class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  // Lista para armazenar os veículos adicionados
  List<int> vehicleList = [];

  // Função para adicionar um novo veículo à lista
  void _addVehicleCard() {
    setState(() {
      vehicleList.add(vehicleList.length + 1);
    });
  }

  // Função para remover um veículo da lista
  void _removeVehicleCard(int vehicleNumber) {
    setState(() {
      vehicleList.remove(vehicleNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Cor de fundo da tela
      appBar: AppBar(
        backgroundColor: Colors.blue, // Cor de fundo da AppBar
        elevation: 0, // Remove a sombra da AppBar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu, color: Colors.white), // Ícone de menu
            Column(
              children: [
                // Exibe a quantidade de veículos
                Text(
                  'Quantidade de veículos\n${vehicleList.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                // Exibe o resultado financeiro baseado na quantidade de veículos
                Text(
                  'Resultado Faturamento Líquido\n+ 20% = R\$ ${vehicleList.length * 30}K',
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(color: Colors.greenAccent, fontSize: 12),
                ),
              ],
            ),
            // Botão para adicionar um novo veículo
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: _addVehicleCard,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white, // Cor de fundo do corpo da tela
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: vehicleList.isEmpty
              // Mensagem exibida quando não há veículos adicionados
              ? const Center(
                  child: Text(
                    'Nenhum veículo adicionado.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              // Lista de veículos exibida em formato de cards
              : ListView.builder(
                  itemCount: vehicleList.length,
                  itemBuilder: (context, index) {
                    return VehicleCard(
                      vehicleNumber: vehicleList[index],
                      onRemove: () => _removeVehicleCard(vehicleList[index]),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

// Widget que representa o card de um veículo
class VehicleCard extends StatelessWidget {
  final int vehicleNumber; // Número do veículo
  final VoidCallback onRemove; // Função para remover o veículo

  const VehicleCard({super.key, required this.vehicleNumber, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue, width: 1), // Borda azul
        borderRadius: BorderRadius.circular(5), // Cantos arredondados
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Espaço reservado para a foto do veículo
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
                // Informações detalhadas do veículo
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Modelo do veículo
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
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: onRemove,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            textStyle: const TextStyle(fontSize: 10),
                          ),
                          child: const Text('Remover'),
                        ),
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
