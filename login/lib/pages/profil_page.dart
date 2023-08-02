import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              // Remplacez cet avatar par l'image de profil de l'utilisateur s'il y en a une
              radius: 60,
              child: Icon(Icons.person, size: 100),
            ),
            SizedBox(height: 20),
            Text(
              'Nom de l\'utilisateur',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Adresse e-mail de l\'utilisateur',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ajoutez ici la logique pour éditer le profil de l'utilisateur
              },
              child: Text('Modifier le profil'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ajoutez ici la logique pour se déconnecter de l'application
              },
              child: Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }
}
