import 'package:flutter/material.dart';
import 'package:tp_supermercado/entities/models.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController descriptionInput = TextEditingController();
  TextEditingController priceInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
          ],
        ),
      ),
    );
  }
}