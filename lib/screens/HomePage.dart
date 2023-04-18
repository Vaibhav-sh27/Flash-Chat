import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/ChatUserCard.dart';
import 'welcome_screen.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_screen';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_comment_rounded),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 9.1),
        itemBuilder: (context, index) {
          return ChatUserCard();
        },
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
