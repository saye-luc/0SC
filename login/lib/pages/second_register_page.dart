import 'package:flutter/material.dart';
import '../components/my_button.dart'; // Importer la classe MyButton
import 'validation_page.dart'; // Importer la classe ValidationPage

class SecondRegisterPage extends StatelessWidget {
  final void Function()
      signUserUp; // Ajouter la fonction signUserUp en tant que paramètre

  const SecondRegisterPage(
      {required this.signUserUp}); // Constructeur pour recevoir la fonction signUserUp

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                // welcome back, you've been missed!
                const Center(
                  child: Text(
                    'Mes Documents ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 15, 14, 14),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Votre logo personnalisé ici
                Image.asset(
                  'lib/images/diplome.png', // Remplacez par le chemin de votre logo
                  width: 150,
                  height: 150,
                ),
                // Card pour télécharger le diplôme
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      'lib/images/diplome.png', // Remplacez par le chemin de l'image du diplôme
                      width: 40,
                      height: 40,
                    ),
                    title: Text('Télécharger votre diplôme'),
                    trailing: IconButton(
                      icon: Icon(Icons.file_upload),
                      onPressed: () {
                        // Implémenter ici la logique de téléchargement de fichier
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                // Votre logo personnalisé ici
                Image.asset(
                  'lib/images/diplome.png', // Remplacez par le chemin de votre logo
                  width: 150,
                  height: 150,
                ),
                // Card pour télécharger la carte d'identité
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      'lib/images/carte.png', // Remplacez par le chemin de l'image de la carte d'identité
                      width: 40,
                      height: 40,
                    ),
                    title: Text('Télécharger votre carte d\'identité'),
                    trailing: IconButton(
                      icon: Icon(Icons.file_upload),
                      onPressed: () {
                        // Implémenter ici la logique de téléchargement de fichier
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ValidationPage(), // Afficher la page ValidationPage lorsque le bouton est pressé
                      ),
                    );
                  },
                  text: 'S\'inscrire',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
