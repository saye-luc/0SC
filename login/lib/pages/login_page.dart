import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';
import '../services/auth_services.dart';
import 'forgot_password_page.dart';
import 'accueil_page.dart'; // Importer la page Accueil

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // try sign
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);

      // Navigate to Accueil after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AccueilPage()), // Page Accueil
      );
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      errorMessage(e.code);
    }
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
                    color: Color.fromARGB(255, 167, 225, 187),
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
                    color: Color.fromARGB(255, 149, 233, 170),
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    // Votre logo personnalisé ici
                    Image.asset(
                      'lib/images/medicine.png', // Remplacez par le chemin de votre logo
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 50),
                    // welcome back, you've been missed!
                    const Text(
                      'Connexion',
                      style: TextStyle(
                        color: Color.fromARGB(255, 6, 6, 6),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 25),
                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'je n\'ai pas de compte',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Creer un compte',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // username textfield
                    MyTextField(
                      controller: emailController,
                      hintText: 'email',
                      obscureText: false,
                    ),
                    // ...
                    const SizedBox(height: 10),
                    // password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    // forgot password?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ForgotPasswordPage();
                              }));
                            },
                            child: const Text(
                              'Mot de passe oublié?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    // sign in button
                    MyButton(
                      onTap: signUserIn,
                      text: "Se connecter",
                    ),
                    const SizedBox(height: 10),
                    // google + apple sign in buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google button
                        SquareTile(
                          imagePath: 'lib/images/google.png',
                          onTap: () => AuthService().signInwithGoogle(),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
