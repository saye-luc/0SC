import 'package:flutter/material.dart';
import 'login_page.dart'; // Importer la classe LoginPage

void main() {
  runApp(MaterialApp(
    home: CompteCertifie(),
  ));
}

class CompteCertifie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'lib/images/Certification-amico.png', // Remplacez par le chemin de votre image d'accueil
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 10),
                Text(
                  'Compte Certifié',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(onTap: () {},), // Afficher la page LoginPage lorsque le bouton est pressé
                      ),
                    );
                  },
                  child: Text('Se connecter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
