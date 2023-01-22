import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  final double width, height;
  final Widget child;
  final String image;

  const FrostedGlassBox({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 7.0,
              sigmaY: 7.0,
            ),
          ),
          Opacity(
              opacity: 0.30,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: width,
                height: height,
              )),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 30,
                  offset: const Offset(2, 2),
                )
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white38.withOpacity(0.3),
                    Colors.black12.withOpacity(0.2),
                  ],
                  stops: const [
                    0.0,
                    1.0,
                  ]),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
