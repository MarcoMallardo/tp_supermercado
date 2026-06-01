import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_supermercado/entities/models.dart';

class CalcScreen extends StatefulWidget {
  final CalcData? calcData;

  const CalcScreen({super.key, this.calcData});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  @override
  Widget build(BuildContext context) {
    final CalcData? calcData = widget.calcData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            if (calcData == null) ...[
              const Text(
                'No hay datos para calcular.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ] else ...[
              const Text(
                'Producto Más Caro',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Nombre: ${calcData.mostExpensive.name}'),
              const SizedBox(height: 4),
              Text('Descripción: ${calcData.mostExpensive.description}'),
              const SizedBox(height: 16),
              const Text(
                'Producto Más Barato',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Nombre: ${calcData.cheapest.name}'),
              const SizedBox(height: 4),
              Text('Descripción: ${calcData.cheapest.description}'),
              const SizedBox(height: 16),
              const Text(
                'Producto con Mayor Cantidad',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Nombre: ${calcData.largestQuantity.name}'),
              const SizedBox(height: 4),
              Text('Descripción: ${calcData.largestQuantity.description}'),
              const SizedBox(height: 16),
              const Text(
                'Producto con Menor Cantidad',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Nombre: ${calcData.smallestQuantity.name}'),
              const SizedBox(height: 4),
              Text('Descripción: ${calcData.smallestQuantity.description}'),
              const SizedBox(height: 16),
              const Text(
                'Precio Promedio',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('\$${calcData.averagePrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/addProduct');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Volver a Cargar Productos',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}