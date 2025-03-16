import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            const SizedBox(height: 20),
            Text('Nombre: Usuario Ejemplo', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Correo: usuario@example.com', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Teléfono: +123456789', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Dirección: Calle Falsa 123', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción de editar perfil
                },
                child: const Text('Editar Perfil'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
