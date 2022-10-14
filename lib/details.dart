import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tietgram/home.dart';
import 'main.dart';
import 'home.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

final eController=TextEditingController();
  final pController=TextEditingController();
final nCont = TextEditingController();
  final gCont = TextEditingController(); 
  Future addDat() async{
 /* UserCredential result=await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: eController.text.trim(),
      password: pController.text.trim(),
      );*/
     // User user=result.user;
      //User user = result.user;
     // await FirebaseFirestore.instance.collection('mydata').add(FirebaseAuth.instance.currentUser!.uid.toString());
  //await FirebaseFirestore.instance.collection('mydata').doc(FirebaseAuth.instance.currentUser!.uid.toString()).set({'Name':nCont});
  
/*Creates doc name randomly */
 /* CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid=auth.currentUser!.uid.toString();
  users.add({'uid':uid,'name':nCont.text,'gorup':gCont.text});// the document name is automatically set by firestore according to current user.
  return;*/
   
   /*This creates doc name acc to uid*/
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid=auth.currentUser!.uid.toString();
  var coll = FirebaseFirestore.instance.collection('Users');
  coll.doc(uid).set({'uid':uid,'name':nCont.text,'group':gCont.text,'count':0});
}
//For Images

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: Column(
        children: [
          Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(controller: nCont,
                    decoration: InputDecoration(
                      helperText: 'Full Name',
                      border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                      ),
                      
                    ),
                  ),
                ),

                Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(controller: gCont,
                    decoration: InputDecoration(
                      helperText: 'Branch Code e.g 3CO5',
                      border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                      ),
                    ),
                    ),
                  ),
                   Container(
                    child: ElevatedButton(child: Text('Enter'),
                    onPressed: (){
                      addDat();
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Home();
                      }
                      )
                      );
                      }
                    )
                  ),
                 /* Container(
                    child: ElevatedButton(child: Text('Go To Home'),onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Home();
                      }
                      )
                      );
                    }
                    )
                  )*/
        ],
      )

    );
  }
}

