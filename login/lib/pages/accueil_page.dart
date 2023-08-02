import 'package:flutter/material.dart';
import 'communaute_page.dart'; // Importer la communaute_page
import 'clients_page.dart'; // Importer la clients_page
import 'boite_message_page.dart'; // Importer la boite_message
import 'profil_page.dart'; // Importer la profil_page
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    home: AccueilPage(),
  ));
}

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  // Booléen pour déterminer si on affiche l'image ou la vidéo
  bool showImage = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Stack des cercles colorés (le code que vous avez fourni)
          Stack(
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
            ],
          ),

          // Publicité (Remplacez cette partie par votre publicité)
          Container(
            height: 300, // Hauteur de la publicité
            color: Color.fromARGB(
                255, 84, 84, 82), // Remplacez par le style de votre publicité
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Image de la publicité (Affichez seulement si showImage est vrai)
                if (showImage)
                  Image.asset(
                    'lib/images/logo.png', // Remplacez par le chemin de votre image publicitaire
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),

                // Vidéo de la publicité (Affichez seulement si showImage est faux)
                if (!showImage)
                  AspectRatio(
                    aspectRatio: 16 / 9, // Rapport d'aspect de la vidéo
                    child: VideoPlayerWidget(
                        videoUrl:
                            'https://www.example.com/videofile.mp4'), // Remplacez par l'URL de votre vidéo
                  ),

                // Autres éléments superposés dans la publicité
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    'Super Promotion !',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Le reste du contenu de la page (GridView avec les containers d'images)
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(
                  16), // Ajoute un espace autour de tous les containers
              children: [
                // Première image (Communaute)
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Ajoute un espace autour de ce container
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommunautePage()),
                        );
                      },
                      child: Image.asset(
                        'lib/images/communaute.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),

                // Deuxième image (Clients)
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Ajoute un espace autour de ce container
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientsPage()),
                        );
                      },
                      child: Image.asset(
                        'lib/images/clients.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),

                // Troisième image (BoiteMessage)
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Ajoute un espace autour de ce container
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BoiteMessage()),
                        );
                      },
                      child: Image.asset(
                        'lib/images/boite_message.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),

                // Quatrième image (Profil)
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Ajoute un espace autour de ce container
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilPage()),
                        );
                      },
                      child: Image.asset(
                        'lib/images/profil.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container();
  }
}
