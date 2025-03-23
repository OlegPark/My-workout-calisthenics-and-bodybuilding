import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Oneboarding1 extends StatelessWidget {
  const Oneboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/image.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}