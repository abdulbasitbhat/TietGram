import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tietgram/home.dart';
import 'main.dart';
import 'home.dart';
import 'details.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: PreferredSize(
            child: AppBar(
              title:const Center(child: Text('TietGram Settings'),
              ),
              ),
              preferredSize: Size.fromHeight(25),
          ),
            body: Container(
              margin: const EdgeInsets.all(10),
              //padding: EdgeInsets.symmetric(horizontal:500),
              child: Column(children: [
                Center(
                  child: ElevatedButton(child: Text('Logout'),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                 /* onPressed: (){ 
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                       return MyApp();
                    }
                    ),
                    );
                  },*/
                  ),
                ),

                Container(
                    margin: EdgeInsets.all(10),
                   // padding: EdgeInsets.symmetric(horizontal:20),
                    child: ElevatedButton(
                      onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Details();
                      }
                      )
                      );
                    },
                     child: Text('Add/Change User Data'),
          
                    ),
                  ),
                  Container(child: Text('You Wont Appear in Community Unless You Add Data'),)
              ]
              )
            )

      )
    );
  }
}