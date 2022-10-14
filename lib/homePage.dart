import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tietgram/getData.dart';
import 'details.dart';
import 'upload.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _homepageState();
}


class _homepageState extends State<Homepage> {

String uidd= FirebaseAuth.instance.currentUser!.uid.toString();
late dynamic userData= FirebaseFirestore.instance.collection("Users").doc(uidd.toString()).get();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            child: AppBar(
              title: const Center(
                child: Text('Home')
                ),
            ),
             preferredSize: Size.fromHeight(25),
          ),
            body: Center(
              child: Column(
                children: [
                     Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            child:Text('ID'),
                          ),
                          Container(
                                 child: Text(FirebaseAuth.instance.currentUser!.uid),
                                 
                     ),
                        ],
                      )
                     ),
                     Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          
                          children: [
                            Container(
                               child: Text('Email'),
                            ),
                             Container(
                              margin: EdgeInsets.all(6),
                              child: Center(child: Text(FirebaseAuth.instance.currentUser!.email.toString())
                              )
                             ),
                             Container(
                                   child: ElevatedButton(
                                    onPressed: (){
                                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
                                         {
                                                 return UploadPage();
                                         }
                                         )
                                         );
                                                 },
                                  child: Text('Upload'),
                                       )
                                     )
                            /* Container(
                              margin: EdgeInsets.all(10),
                              child: Center(child: 
                              FutureBuilder(builder: (context,snapshot){
                                return ListTile(
                                  title: Column(
                                    children: [
                                      if(getUsername(documentId:FirebaseAuth.instance.currentUser!.uid)!=Null)...[
                                      Center(child: getUsername(documentId:FirebaseAuth.instance.currentUser!.uid ,)),]
                                      else...[
                                        Center(child: Text('Please Enter Data in Settings'),)
                                      ]

                                    ],
                                  ),
                                  
                                );
                              },))
                             ),*/
                        ],
                        ),
                      ),
                     ),
                    /* Container(
                      margin: EdgeInsets.all(10),
                      child: Text('Bio Here')
                     ),
                     Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: [

                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text('Followers Here')
                              ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text('Folllowing Here')
                              ),
                          ],
                        ),
                      )
                     ),*/

                ]
                ),
            ),
          )
    );
  }
}

/*
class displatData extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Details,
      builder: 
      )



    /*if(getUsername(documentId:FirebaseAuth.instance.currentUser!.uid) != Null){
      return Center(child: getUsername(documentId:FirebaseAuth.instance.currentUser!.uid));
    }
    else{
      return Text('Please Enter Data in Settings');
    }*/
  }
}*/