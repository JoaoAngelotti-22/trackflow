import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isAddingVehicle = false;

  final TextEditingController _plateController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _selectedYear = TextEditingController();
  final TextEditingController _cargoCapacityController =
      TextEditingController();
  final TextEditingController _cargoTypeController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _cnpjCpfController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _renavamController = TextEditingController();
  final TextEditingController _chassisYearController = TextEditingController();
  final TextEditingController _fuelController = TextEditingController();
  final TextEditingController _kmDrivenController = TextEditingController();

  String? _selectedBrand;
  String? _selectedVehicleType;
  DateTime? _selectedLicenseDate;
  DateTime? _selectedLastMaintenance;

  final List<String> _brands = [
    "Abarth",
    "Acura",
    "Alfa Romeo",
    "Aston Martin",
    "Audi",
    "BMW",
    "Bugatti",
    "Chevrolet",
    "Chrysler",
    "Citroën",
    "Dodge",
    "Ferrari",
    "Fiat",
    "Ford",
    "Honda",
    "Hyundai",
    "Jaguar",
    "Jeep",
    "Kia",
    "Lamborghini",
    "Land Rover",
    "Lexus",
    "Maserati",
    "Mazda",
    "Mercedes-Benz",
    "Mini",
    "Mitsubishi",
    "Nissan",
    "Peugeot",
    "Porsche",
    "RAM",
    "Renault",
    "Subaru",
    "Suzuki",
    "Tesla",
    "Toyota",
    "Volkswagen",
    "Volvo",
    "BYD",
    "Polestar",
    "Rivian",
    "Lucid Motors"
  ];

  final List<String> _vehicleTypes = [
    "Carro",
    "Caminhão",
    "Moto",
    "Van",
    "Ônibus",
    "Outros"
  ];

  // Lista de veículos (Exemplo de veículos que podem ser adicionados)
  List<String> _vehicleList = [];

  void _toggleVehicleForm() {
    setState(() {
      _isAddingVehicle = !_isAddingVehicle;
    });
  }

  Future<void> _selectDate(
      BuildContext context, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Adicionar Veículo",
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(_isAddingVehicle ? Icons.close : Icons.add,
                color: Colors.white),
            onPressed: _toggleVehicleForm,
          ),
        ],
      ),
      body: _isAddingVehicle ? _buildVehicleForm() : _buildVehicleList(),
    );
  }

  Widget _buildVehicleForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildSectionHeader("1 - Informações do Veículo"),
            _buildTextField("Placa", _plateController, isRequired: true),
            _buildDropdown("Marca/Modelo", _brands, (value) {
              setState(() => _selectedBrand = value);
            }, _selectedBrand, isRequired: true),
            _buildTextField("Ano de Fabricação", _selectedYear),
            _buildTextField("Cor", _colorController, isRequired: true),
            _buildDropdown("Tipo de Veículo", _vehicleTypes, (value) {
              setState(() => _selectedVehicleType = value);
            }, _selectedVehicleType, isRequired: true),
            _buildTextField("Capacidade de Carga", _cargoCapacityController),
            _buildTextField("Tipo de Carga", _cargoTypeController),
            _buildSectionHeader(
                "2 - Informações do Proprietário/Transportadora"),
            _buildTextField(
                "Nome da Transportadora/Proprietário", _ownerNameController,
                isRequired: true),
            _buildTextField("CNPJ/CPF", _cnpjCpfController,
                isRequired: true, isNumeric: true),
            _buildTextField("Telefone de Contato", _contactController,
                isRequired: true, isPhone: true),
            _buildTextField("Renavam", _renavamController,
                isRequired: true, isRenavam: true),
            _buildDatePicker(
                "Vencimento do Licenciamento", _selectedLicenseDate, (date) {
              setState(() => _selectedLicenseDate = date);
            }, isRequired: true),
            _buildSectionHeader("3 - Informações Técnicas"),
            _buildTextField(
                "Fabricante e Ano do Chassi", _chassisYearController),
            _buildTextField("Combustível", _fuelController),
            _buildTextField("Km Rodado", _kmDrivenController,
                isRequired: true, isNumeric: true),
            _buildDatePicker("Última Manutenção", _selectedLastMaintenance,
                (date) {
              setState(() => _selectedLastMaintenance = date);
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    // Adiciona o veículo à lista quando o formulário é enviado
                    _vehicleList.add(_plateController
                        .text); // Apenas a placa, você pode adicionar outros dados também
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Veículo salvo com sucesso!")),
                  );
                  _toggleVehicleForm(); // Fecha o formulário após adicionar
                }
              },
              child: const Text("Salvar Veículo"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isRequired = false,
      bool isNumeric = false,
      bool isPhone = false,
      bool isRenavam = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label + (isRequired ? " *" : "")),
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      validator: isRequired
          ? (value) {
              if (value == null || value.isEmpty) {
                return "Campo obrigatório";
              }
              if (isPhone && !RegExp(r'^\d{10,11}$').hasMatch(value)) {
                return "Telefone inválido";
              }
              if (isRenavam && !RegExp(r'^\d{9}$').hasMatch(value)) {
                return "Renavam inválido";
              }
              return null;
            }
          : null,
    );
  }

  Widget _buildDropdown(String label, List<String> items,
      Function(String?) onChanged, String? selectedValue,
      {bool isRequired = false}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          labelText: label + (isRequired ? " *" : ""),
          border: OutlineInputBorder()),
      value: selectedValue,
      onChanged: onChanged,
      validator: isRequired
          ? (value) => value == null ? "Campo obrigatório" : null
          : null,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
    );
  }

  Widget _buildDatePicker(
      String label, DateTime? selectedDate, Function(DateTime) onDateSelected,
      {bool isRequired = false}) {
    return TextButton(
      onPressed: () => _selectDate(context, onDateSelected),
      child: Text(selectedDate != null
          ? DateFormat('dd/MM/yyyy').format(selectedDate)
          : label + (isRequired ? " *" : "")),
    );
  }

  // Método para construir a lista de veículos
  Widget _buildVehicleList() {
    if (_vehicleList.isEmpty) {
      return const Center(child: Text("Nenhum veículo adicionado."));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: _vehicleList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(_vehicleList[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _vehicleList.removeAt(index); // Remove o veículo da lista
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
