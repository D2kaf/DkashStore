import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo degradado
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.grey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Contenido principal
          Column(
            children: [
              const SizedBox(height: 50), // Espacio en la parte superior

              // Título con animación
              TweenAnimationBuilder(
                duration: const Duration(seconds: 2),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, (1 - value) * -50),
                      child: child,
                    ),
                  );
                },
                child: const Text(
                  'Bienvenido a Dkash Store',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              // Carrusel de imágenes
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 1.0, // Permite que la imagen ocupe todo el ancho
                ),
                items: [
                  'assets/images/Dkashbasica.png',
                  'assets/images/Dkashbasicaback.png',
                ].map((imagePath) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(0), // Elimina los bordes redondeados
                    child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
