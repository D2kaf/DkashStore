import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              'Bienvenido a Dkash Store',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 350,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                'assets/images/Dkashbasica.png',
                'assets/images/Dkashbasicaback.png'
              ].map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}