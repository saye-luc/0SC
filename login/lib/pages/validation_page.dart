import 'package:flutter/material.dart';



class ValidationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation en cours'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              right: -80,
              top: -50,
              child: Transform(
                transform: Matrix4.identity()..rotateZ(20),
                origin: const Offset(50, 50),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 33, 243, 107),
                  ),
                ),
              ),
            ),
            Positioned(
              left: -150,
              bottom: -350,
              child: Transform(
                transform: Matrix4.identity()..rotateZ(-20),
                origin: const Offset(50, 50),
                child: Container(
                  width: 500,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 152, 156, 153),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/validation.png', // Remplacez par le chemin de votre image PNG
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                const Text(
                  'validation en cours...\n veuiller patienter',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'lib/images/animation_validation.gif', // Remplacez par le chemin de votre image GIF
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
