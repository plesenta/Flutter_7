import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practich5/main.dart';


class NewScreen extends StatefulWidget {
  const NewScreen({ Key ? key }) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}


class _NewScreenState extends State<NewScreen> {
  
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth= FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print("No user found for that email");
      }
    }

    return user;
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(     
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Registartion", 
            style: TextStyle(
              color: Colors.black,
               fontSize: 28.0,
               fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Sign Up to App",
            style: TextStyle(
              color: Colors.black,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 44.0,
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "User Email",
              prefixIcon: Icon(Icons.mail, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "User Password",
              prefixIcon: Icon(Icons.lock, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),     
          const SizedBox(
            height: 88.0,
          ),
          Container(
           width: double.infinity,
           child: RawMaterialButton(
            fillColor: const  Color(0xFF0069FE),
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)),
            onPressed: () async {
              await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));          
            },
            child: const Text("Sign Up", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                )),
            ),
          ),         
        ],
      ),
    ),
    );
  }

}