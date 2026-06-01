import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_supermercado/entities/models.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  Product? mostExpensive;
  Product? cheapest;
  Product? largestQuantity;
  Product? smallestQuantity;
  double totalPrice = 0;
  int productCount = 0;

  void addProduct() {
    // Validar que los campos no estén vacíos
    if (nameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        priceController.text.isEmpty ||
        quantityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return;
    }

    // Validar que el precio sea un número válido
    double? price = double.tryParse(priceController.text);
    if (price == null || price < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El precio debe ser un número válido mayor a 0')),
      );
      return;
    }

    // Validar que la cantidad sea un número válido
    int? quantity = int.tryParse(quantityController.text);
    if (quantity == null || quantity < 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La cantidad debe ser un número entero mayor a 0')),
      );
      return;
    }

    // Crear el producto
    Product newProduct = Product(
      name: nameController.text,
      description: descriptionController.text,
      price: price,
      quantity: quantity,
    );

    // Actualizar estadísticos sin usar listas
    totalPrice += price;
    productCount++;

    final currentMostExpensive = mostExpensive;
    if (currentMostExpensive == null || price > currentMostExpensive.price) {
      mostExpensive = newProduct;
    }

    final currentCheapest = cheapest;
    if (currentCheapest == null || price < currentCheapest.price) {
      cheapest = newProduct;
    }

    final currentLargestQuantity = largestQuantity;
    if (currentLargestQuantity == null || quantity > currentLargestQuantity.quantity) {
      largestQuantity = newProduct;
    }

    final currentSmallestQuantity = smallestQuantity;
    if (currentSmallestQuantity == null || quantity < currentSmallestQuantity.quantity) {
      smallestQuantity = newProduct;
    }

    // Limpiar los campos
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    quantityController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Producto agregado exitosamente')),
    );
  }

  void goToResults() {
    final mostExpensiveValue = mostExpensive;
    final cheapestValue = cheapest;
    final largestQuantityValue = largestQuantity;
    final smallestQuantityValue = smallestQuantity;

    if (productCount > 0 &&
        mostExpensiveValue != null &&
        cheapestValue != null &&
        largestQuantityValue != null &&
        smallestQuantityValue != null) {
      final calcData = CalcData(
        mostExpensive: mostExpensiveValue,
        cheapest: cheapestValue,
        largestQuantity: largestQuantityValue,
        smallestQuantity: smallestQuantityValue,
        averagePrice: totalPrice / productCount,
      );
      context.go('/calc', extra: calcData);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debe ingresar al menos un producto')),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cargar Productos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              setState(() {
                mostExpensive = null;
                cheapest = null;
                largestQuantity = null;
                smallestQuantity = null;
                totalPrice = 0;
                productCount = 0;
              });
              context.go('/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Campo de nombre
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre del Producto',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.shopping_bag),
                ),
              ),
              const SizedBox(height: 16),
              // Campo de descripción
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.description),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              // Campo de precio
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.attach_money),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 16),
              // Campo de cantidad
              TextField(
                controller: quantityController,
                decoration: InputDecoration(
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.inventory_2),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              // Botón para agregar producto
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: addProduct,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Ingresar Producto',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Botón para calcular
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: goToResults,
                  icon: const Icon(Icons.calculate),
                  label: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}