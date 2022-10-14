import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tietgram/getData.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final unameCont=TextEditingController();

  List<String> docID=[];
  late String id='';

  //get docIDs
  Future getID() async{
    await FirebaseFirestore.instance.collection('Users').get().then((snapshot) => snapshot.docs.forEach((document){
      print(document.reference);
      docID.add(document.reference.id);
      //Username.add(document.reference.name);
    },
    ),
    );
  }
  

  void dispose(){
    unameCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          //child: AppBar(title: const Center(child: Text('Search')   //uncomment when search implemented
          child: AppBar(title: const Center(child: Text('Community')
          )
          ),
          preferredSize: Size.fromHeight(25),
        ),
        body: Column(
          children: [
           /* Container(
              margin: const EdgeInsets.all(10),
              child: TextField(controller: unameCont,
                decoration: InputDecoration(
              helperText: 'Enter UserId',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 27, 40, 90),
                  width: 2.0,
                  )
                ),
              )

            ),
            ),*/  //uncomment when search implemented
            
              
               /* Container(child:
                 Center(
                   child: ElevatedButton(
                    child: const Text('Search'),
                    onPressed: (){
                       id=unameCont.toString();
                    }
                    ),
                 )
                  ),*/   //uncomment when search implemented
                 
                 
                  Expanded(
                    child: FutureBuilder(
                      future: getID(),
                      builder: (context,snapshot){
                      return ListView.builder(
                      itemCount: docID.length,
                      itemBuilder: (context,index){
                        
                      return ListTile(
                        title: Container(
                          padding:EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          color: Color.fromARGB(255, 38, 189, 235),
                          child:getUsername(documentId:docID[index]),),   //For displaying all users
                        //title:getUsername(documentId:FirebaseAuth.instance.currentUser!.uid,)
                      );
                        
                        
                    }
                    );
                    }
                    ),
                  )
                  //'Name: ${data['name']}\nGroup: ${data['group']}'
                  /*Expanded(
                    child: FutureBuilder(
                      future: getID(),
                      builder: (context,snapshot){
                      return ListView.builder(
                      itemCount: docID.length,
                      itemBuilder: (context,index){
                        if(u.length!=0){
                      return ListTile(
                        title: 
                      );
                        }
                        else{
                          return Text('Loading...');
                        }
                    }
                    );
                    }
                    ),
                  )*/
             
            
          ],
        ),
        ),
        );
  }
}