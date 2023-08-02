import 'package:flutter/material.dart';

// Classe de modèle pour représenter les détails du client
class Client {
  final String nom;
  final String adresse;
  // Ajoutez d'autres propriétés du client selon vos besoins

  Client({required this.nom, required this.adresse});
}

class ClientsPage extends StatefulWidget {
  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  List<Client> clients = []; // Liste pour stocker les clients récupérés

  @override
  void initState() {
    super.initState();
    // Appelez la fonction pour récupérer les clients depuis Firebase au démarrage de l'écran
    fetchClients();
  }

  // Fonction pour récupérer les clients de Firebase
  void fetchClients() {
    // Vous pouvez utiliser Firebase ici pour récupérer la liste de clients
    // Par exemple, utilisez FirebaseDatabase.instance.reference().child('clients')...
    // Pour l'instant, je vais simplement simuler quelques clients pour l'exemple.
    List<Client> dummyClients = [
      Client(nom: 'Client 1', adresse: 'Adresse 1'),
      Client(nom: 'Client 2', adresse: 'Adresse 2'),
      Client(nom: 'Client 3', adresse: 'Adresse 3'),
      // Ajoutez d'autres clients ici selon vos besoins
    ];

    setState(() {
      clients = dummyClients;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clients'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Liste des clients',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: clients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(clients[index].nom),
                    subtitle: Text(clients[index].adresse),
                    onTap: () {
                      // Naviguez vers l'écran qui affiche les détails du client
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsClientPage(clients[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Écran pour afficher les détails du client
class DetailsClientPage extends StatelessWidget {
  final Client client;

  DetailsClientPage(this.client);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du client'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nom: ${client.nom}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Adresse: ${client.adresse}',
              style: TextStyle(fontSize: 18),
            ),
            // Ajoutez ici d'autres détails du client à afficher
          ],
        ),
      ),
    );
  }
}
