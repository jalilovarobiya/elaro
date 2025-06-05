import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarusel extends StatelessWidget {
  const MyCarusel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://api.elaro.uz/storage/01JWDMYRCD09ZJS8FPSNK51CTZ.png',
      'https://api.elaro.uz/storage/01JWDJWXVB770FBBRHG574H7ZM.webp',
      'https://api.elaro.uz/storage/01JWDN7V4T4J98YJ8X6ZCGHQYY.png',
    ];
    return CarouselSlider(
      options: CarouselOptions(
        autoPlayCurve: Curves.ease,
        height: 200,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items:
          imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(url, fit: BoxFit.cover),
                );
              },
            );
          }).toList(),
    );
  }
}
