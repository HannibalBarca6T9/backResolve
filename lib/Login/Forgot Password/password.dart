import 'package:flutter/material.dart';

import 'new_pass.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
      ),
      bottomNavigationBar: null,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right:20, left: 20 ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mot de passe oublié', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),),
              const SizedBox(
                height: 20,
              ),
              RichText(text: TextSpan(
                style: TextStyle(
                  color: Color(0xFF151940),
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),              children: <TextSpan> [
                  TextSpan(text: 'Veuillez saisir votre '),
                  TextSpan(text: 'adresse e-mail ou numéro de téléphone ', style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  TextSpan(text: 'pour réinitialiser votre mot de passe'),
                ]
              ), ),
              const SizedBox(
                height: 50,
              ),
              const Text('Email/Numéro',style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40,
                  child: TextField(
                    obscureText: true,
        
                    maxLines: 1,
                    decoration: InputDecoration(
                      
        
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
          color: Colors.grey,
          width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
          color: Colors.blue,
          width: 2.0,
              ),
            ),
          ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewPassword()),);
                      }, child: const Text('Réinitialiser', style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,
                      ),),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ) ,
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xFF333A56)
                      ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}