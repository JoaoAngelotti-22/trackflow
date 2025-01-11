import 'package:flutter/material.dart';

// Função principal que inicia o app
void main() {
  runApp(MyApp());
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      home: VehicleDashboard(), // Define a tela inicial
    );
  }
}

// Tela principal do dashboard de veículos
class VehicleDashboard extends StatefulWidget {
  @override
  _VehicleDashboardState createState() => _VehicleDashboardState();
}

// Estado da tela principal
class _VehicleDashboardState extends State<VehicleDashboard> {
  List<int> vehicleList = []; // Lista para armazenar os veículos

  // Função para adicionar um novo card de veículo
  void _addVehicleCard() {
    setState(() {
      vehicleList.add(vehicleList.length + 1);
    });
  }

  // Função para remover um card de veículo
  void _removeVehicleCard(int index) {
    setState(() {
      vehicleList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back, color: Colors.white), // Ícone de voltar
            // Aqui temos que colocar a função de chamar para a página anterior
            Column(
              children: [
                Text(
                  'Quantidade de veículos\n${vehicleList.length}', // Exibe a quantidade de veículos
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  'Resultado Faturamento Líquido\n+ 20% = R\$ ${vehicleList.length * 30}K', // Exibe o resultado financeiro
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.greenAccent, fontSize: 12),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white), // Ícone de adicionar
              onPressed: _addVehicleCard, // Chama a função de adicionar
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: vehicleList.isEmpty
            ? Center(
                child: Text(
                  'Nenhum veículo adicionado.', // Mensagem quando não há veículos
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: vehicleList.length, // Define o número de cards
                itemBuilder: (context, index) {
                  return VehicleCard(
                    vehicleNumber: vehicleList[index], // Número do veículo
                    onRemove: () =>
                        _removeVehicleCard(index), // Função de remoção
                  );
                },
              ),
      ),
    );
  }
}

// Widget que representa o card de veículo
class VehicleCard extends StatelessWidget {
  final int vehicleNumber; // Número do veículo
  final VoidCallback onRemove; // Função de remoção

  VehicleCard({required this.vehicleNumber, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(5), // Borda arredondada
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
                  color: Colors.grey[300], // Espaço para foto
                  child: Center(
                      child:
                          Text('Foto\nVeículo', textAlign: TextAlign.center)),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Modelo $vehicleNumber',
                          style: TextStyle(
                              fontWeight:
                                  FontWeight.bold)), // Modelo do veículo
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Faturamento'),
                              Text('R\$ 15.000'), // Valor fixo de faturamento
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Custos'),
                              Text('R\$ 10.000'), // Valor fixo de custos
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: onRemove, // Botão de remoção
                child: Text(
                  'Remover',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
