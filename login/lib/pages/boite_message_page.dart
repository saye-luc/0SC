import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';

class BoiteMessage extends StatefulWidget {
  @override
  _BoiteMessageState createState() => _BoiteMessageState();
}

class _BoiteMessageState extends State<BoiteMessage> {
  int numberOfNewMessages = 0;
  List<String> messages = []; // Liste pour stocker les messages récupérés

  @override
  /* void initState() {
    super.initState();
    // Appelez la fonction pour récupérer les données depuis Firebase au démarrage de l'écran
    fetchMessages();
  }

  // Fonction pour récupérer les données de Firebase
  void fetchMessages() {
    DatabaseReference messagesRef = FirebaseDatabase.instance.reference().child('messages');

    // Utilisez la référence pour récupérer les données
    messagesRef.once().then((DataSnapshot snapshot) {
      // Utilisez les données récupérées pour mettre à jour l'interface utilisateur
      setState(() {
        messages = List<String>.from(snapshot.value); // Convertir les données en une liste de messages
        numberOfNewMessages = messages.length;
      });
    });
  }*/

  // Fonction pour accéder à la boîte de messages
  void consulterMessages() {
    // Naviguez vers l'écran qui affiche les messages en passant les messages récupérés en paramètre
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EcranMessages(messages),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boîte de messages'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.email,
              size: 80,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Vous avez $numberOfNewMessages nouveaux messages',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  consulterMessages, // Utilisez la fonction pour accéder à la boîte de messages
              child: Text('Consulter les messages'),
            ),
          ],
        ),
      ),
    );
  }
}

class EcranMessages extends StatelessWidget {
  final List<String> messages;

  EcranMessages(this.messages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(messages[index]),
          );
        },
      ),
    );
  }
}
