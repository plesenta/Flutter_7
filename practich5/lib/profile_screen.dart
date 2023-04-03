import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practich5/main.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key ? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to your profile Page!"),
            Text(user.email!),
            OutlinedButton(
              onPressed: () {
                signOut();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}

Future signOut() async {
    await FirebaseAuth.instance.signOut();
    
  }