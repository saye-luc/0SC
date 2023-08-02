import 'package:flutter/material.dart';

class CommunautePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communauté'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue dans la communauté !',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Ici, vous pouvez discuter avec d\'autres membres, partager vos expériences et poser des questions.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ajoutez ici la logique pour accéder à la fonctionnalité de la communauté
              },
              child: Text('Accéder à la communauté'),
            ),
          ],
        ),
      ),
    );
  }
}
