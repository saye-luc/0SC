import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';



class ForgotPasswordPage extends StatefulWidget {

  ForgotPasswordPage({
    super.key,
  });
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }


  // Error message
  void errorMessage( String message ){
    showDialog(context: context, builder: (context) {
      return  AlertDialog(
        title: Text(
          message,
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    );
  }

  Future passwordReset ()  async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      Navigator.pop(context);
      showDialog(context: context, builder: (context) {
        return  AlertDialog(
          title: Text(
            'Password reset link sent! Check your email',
            style: TextStyle(fontSize: 20),
          ),
        );
      },
      );

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorMessage(e.code);
    }

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter your email and we will send you a password reset link!',
            textAlign: TextAlign.center
            ),
          ),
          MyTextField(
            controller: emailController,
            hintText: 'email',
            obscureText: false,
          ),
          const SizedBox(height: 50),
          MaterialButton(
            onPressed: passwordReset,
            child: Text('Reset password'),
            color:Colors.deepPurple[200] ,
          )
        ],
      ),
    );
  }
}
