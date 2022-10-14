import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tietgram/details.dart';
import 'main.dart';
import 'details.dart';

/*
void main(){
  runApp(Signup());
}*/

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Signup> {
  final eController=TextEditingController();
  final pController=TextEditingController();
  
  
  void dispose(){
    eController.dispose();
    pController.dispose();
    super.dispose();
  }

Future signUP() async{
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: eController.text.trim(), password: pController.text.trim());
 // await FirebaseAuth.instance.signInWithEmailAndPassword(email: eController.text.trim(), password: pController.text.trim());
  //addDat();
  
}



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder:(context,snapshot){
           if(snapshot.hasData){
           // FirebaseAuth.instance.signOut();
            return LoginWidget();
           }
           else{
            return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          child: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Welcome To TietGram'))
            ),
              body: Column(children: [
                
                
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(controller: eController,
                    decoration: InputDecoration(
                      helperText: 'Username',
                      border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(controller:pController,
                  obscureText: true,
                    decoration: InputDecoration(
                      helperText: 'Password',
                      border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                      ),
                    ),
                    ),
                ),
                  
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: (){
                        signUP();
                      },
                       /* Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Details();
                      }
                      )
                      );*/
                      
                     child: Text('Sign Up'),
          
                    ),
                  ),
                  
                  Container(
                    child: ElevatedButton(child: Text('Already have an account?'),onPressed: 
                    (){
                      Navigator.pop(context);
                    },)
                  )
              ]
              ),
          )
        ),
    );

  }
   } 
      );    
  }
}

/*
class addInitData extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid=auth.currentUser!.uid.toString();
  var coll = FirebaseFirestore.instance.collection('Users');
  coll.doc(uid).set({'uid':'','name':'','group':''});
  return 1;
}*/