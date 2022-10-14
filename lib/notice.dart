import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tietgram/getData.dart';


class Notice extends StatefulWidget {
  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  
  List<String> postNIDs=[];

  late String id='';

  //get docIDs
  Future getpostNIDs() async{
    await FirebaseFirestore.instance.collection('NoticePosts').get().then((snapshot) => snapshot.docs.forEach((document){
      print(document.reference);
      postNIDs.add(document.reference.id);
      //Username.add(document.reference.name);
    },
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Center(
              child: Text('Notice Board'),
              ),
              ),
               preferredSize: Size.fromHeight(25),
        ),
            body: Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                    child: FutureBuilder(
                      future: getpostNIDs(),
                      builder: (context,snapshot){
                      return ListView.builder(
                      itemCount: postNIDs.length,
                      itemBuilder: (context,index){
                        
                      return ListTile(
                        title: Container(
                          padding:EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          color: Color.fromARGB(255, 38, 189, 235),
                          child:getFeed2(postNIDs:postNIDs[index]),),   //For displaying all users
                        //title:getUsername(documentId:FirebaseAuth.instance.currentUser!.uid,)
                      );
                        
                        
                    }
                    );
                    }
                    ),
                  )
                  ],
                  ),
              )
            ),
        ),
    );
  }
}