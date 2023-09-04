import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
      ),
      bottomNavigationBar: null,
      body: Padding(padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
      child: SingleChildScrollView(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Entrez votre nouveau mot de passe', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color(0xFF151940),
            ),),
            const SizedBox(
              height: 20,
            ),
            const Text('Mot de passe', style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
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
                height: 25,
              ),
              const Text('Confirmez le mot de passe',style: TextStyle(
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
                       Navigator.pop(context);
                       Navigator.pop(context);
                      }, child: const Text('Continuer', style: TextStyle(
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