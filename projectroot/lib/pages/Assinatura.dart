import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class Assinatura extends StatefulWidget {
  const Assinatura({super.key});

  @override
  _AssinaturaState createState() => _AssinaturaState();
}

class _AssinaturaState extends State<Assinatura> {
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'Assinatura Eletrônica',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assinatura Digital',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      'Insira sua assinatura abaixo',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Signature(
                          controller: _signatureController,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            _signatureController.clear();
                          },
                          icon: const Icon(Icons.clear, color: Colors.white),
                          label: const Text('Limpar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (_signatureController.isNotEmpty) {
                              final signature =
                                  await _signatureController.toPngBytes();
                              // Aqui você pode salvar ou enviar a assinatura
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Assinatura salva com sucesso!')),
                              );
                            }
                          },
                          icon: const Icon(Icons.save, color: Colors.white),
                          label: const Text('Salvar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
