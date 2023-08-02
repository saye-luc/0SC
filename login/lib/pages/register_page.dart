import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/my_textfield.dart';
import '../components/square_tile.dart';
import '../services/auth_services.dart';
import 'second_register_page.dart'; // Importer le fichier de la deuxième page
import '../components/my_button.dart'; // Importer la classe MyButton

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  // sign user up method
  void signUserUp() async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // try creating user with firebase
      if (passwordController.text == confirmpasswordController.text) {
        // Ajouter le code pour créer un utilisateur avec Firebase ici
        // ...

        // pop
        Navigator.pop(context);

        // Ajouter les détails de l'utilisateur
        addUserDetails(
          firstNameController.text,
          lastNameController.text,
          emailController.text,
        );

        // Naviguer vers la page SecondRegisterPage
        goToSecondRegisterPage();
      } else {
        Navigator.pop(context);
        errorMessage('Le mot de passe ne correspond pas');
      }
    } on FirebaseAuthException catch (e) {
      // pop
      Navigator.pop(context);
      errorMessage(e.code);
    }
  }

  // ajouter un utilisateur
  Future addUserDetails(
    String firstName,
    String lastName,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'First name': firstName,
      'Last name': lastName,
      'email': email,
    });
  }

  // Fonction pour naviguer vers la deuxième page
  void goToSecondRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondRegisterPage(
          signUserUp: () {},
        ),
      ),
    );
  }

  // Error message
  void errorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
            style: const TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
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
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 25),
                  // Votre logo personnalisé ici
                  Image.asset(
                    'lib/images/medicine.png', // Remplacez par le chemin de votre logo
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 25),
                  // welcome back, you've been missed!
                  const Center(
                    child: Text(
                      'Inscription',
                      style: TextStyle(
                        color: Color.fromARGB(255, 15, 14, 14),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(height: 25),
                  // first name textfield
                  MyTextField(
                    controller: firstNameController,
                    hintText: 'first name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // last name textfield
                  MyTextField(
                    controller: lastNameController,
                    hintText: 'last name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  //  confirm password textfield
                  MyTextField(
                    controller: confirmpasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  // Bouton "Suivant" pour naviguer vers la deuxième page
                  MyButton(
                    onTap: goToSecondRegisterPage,
                    text: 'Suivant',
                  ),
                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      SquareTile(
                        onTap: () => AuthService().signInwithGoogle(),
                        imagePath: 'lib/images/google.png',
                      ),
                      const SizedBox(width: 25),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'j\'ai un compte!',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
