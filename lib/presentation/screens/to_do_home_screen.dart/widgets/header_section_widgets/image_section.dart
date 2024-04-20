import 'package:flutter/material.dart';
import 'package:todoapp/config/assets/assets.dart';

// Imagen de la parte de arriba
class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomRight,
      child: Image(
        image: AssetImage(AssetsApp.humanAsset),
        height: size.height / 6,
      ),
    );
  }
}
