import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                backgroundImage: AssetImage('assets/images/admin.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text('Nombre: Admin', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Correo: Admin@dkash.com', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Teléfono: +573155881952', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Dirección: Calle 82 #21-73', style: TextStyle(fontSize: 18)),
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
