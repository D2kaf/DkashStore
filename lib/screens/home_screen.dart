import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["Todos", "Hombre", "Zapatería", "Mujer"];
  int selectedCategoryIndex = 0;

  // Lista de productos (Simulación)
  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/images/catalog1.png",
      "name": "Camiseta Negra Dkash",
      "price": "\$49.990"
    },
    {
      "image": "assets/images/catalog1.png",
      "name": "Sudadera Oversize",
      "price": "\$89.990"
    },
    {
      "image": "assets/images/producto3.png",
      "name": "Pantalón Jogger",
      "price": "\$69.990"
    },
    {
      "image": "assets/images/producto4.png",
      "name": "Chaqueta Casual",
      "price": "\$129.990"
    },
  ];

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

          // Contenido desplazable
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50), // Espacio superior

                // 🔍 Barra de búsqueda
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Buscar productos...",
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                      suffixIcon: const Icon(Icons.camera_alt, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15), // Espaciado

                // 📌 Barra de categorías desplazable
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) {
                      return _categoryItem(index);
                    },
                  ),
                ),

                const SizedBox(height: 10), // Espaciado

                // 🏷️ Título con animación
                Center(
                  child: Text(
                    'Bienvenido a Dkash Store',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Espaciado

                // 🛒 Carrusel de productos destacados
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 1.0,
                  ),
                  items: [
                    'assets/images/Dkashbasicafront.png',
                    'assets/images/Dkashbasicaback.png',
                  ].map((imagePath) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20), // Espaciado

                // 🎯 Banner Promocional
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/COMPRE_AHORA.png',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Espaciado

                // 🛍️ Sección de Productos en GridView
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // Desactiva el scroll interno del GridView
                    shrinkWrap: true, // Se ajusta al contenido y no causa errores
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      return _productItem(products[index]);
                    },
                  ),
                ),

                const SizedBox(height: 20), // Espaciado final
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 📌 Widget de categorías con efecto de selección
  Widget _categoryItem(int index) {
    bool isSelected = index == selectedCategoryIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            categories[index],
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  // 🛍️ Widget de cada producto en el GridView
  Widget _productItem(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image.asset(product["image"], height: 120, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              product["name"],
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(product["price"], style: const TextStyle(fontSize: 16, color: Colors.green)),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("Agregar"),
          ),
        ],
      ),
    );
  }
}
