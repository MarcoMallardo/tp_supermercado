import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_supermercado/entities/models.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  // Usuario hardcodeado para validación
  final User validUser = User(username: 'admin', password: '1234');

  void handleLogin() {
    final username = usernameController.text;
    final password = passwordController.text;

    // Validar credenciales
    if (username == validUser.username && password == validUser.password) {
      // Login exitoso, navegar a la pantalla de productos
      context.go('/addProduct');
    } else {
      // Mostrar mensaje de error
      setState(() {
        errorMessage = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Logo o título
              const Text(
                'Supermercado TP',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),
              // Campo de usuario
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 24),
              // Campo de contraseña
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),
              // Mensaje de error
              if (errorMessage != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              // Botón de login
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: handleLogin,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Texto informativo
              const Text(
                'Usuario: admin\nContraseña: 1234',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
