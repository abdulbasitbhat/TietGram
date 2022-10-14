import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

List<String> u=[];

class getUsername extends StatelessWidget {
  final String documentId;
  getUsername({required this.documentId});
  
  @override
  Widget build(BuildContext context) {
    CollectionReference users=FirebaseFirestore.instance.collection('Users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
         if(snapshot.connectionState==ConnectionState.done){
            
            Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic>;
            u.add('${data['name']}\n${data['group']}');
            return Text('${data['name']}    Group: ${data['group']}');
         }
         return Text('Loading...');
  }   
  )
  );
  }
}

List<String> p=[];
class getFeed extends StatelessWidget {
  final String postIDs;
  getFeed({required this.postIDs});
  
  @override
  Widget build(BuildContext context) {
    CollectionReference posts=FirebaseFirestore.instance.collection('posts');

    return FutureBuilder<DocumentSnapshot>(
      future: posts.doc(postIDs).get(),
      builder: ((context, snapshot) {
         if(snapshot.connectionState==ConnectionState.done){
            
            Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic>;
            p.add('${data['image']}\n${data['group']}');
            return Column(
              children: [
                Container(child: Image.network('${data['image']}')),
                Container(child: Text('Uploaded By: ${data['email']}'),),
                Container(child: Text('Caption: ${data['Caption']}'),),
              ],
            );
            //('${data['name']}    Group: ${data['group']}');
         }
         return Text('Loading...');
  }   
  )
  );
  }
}

List<String> pN=[];
class getFeed2 extends StatelessWidget {
  final String postNIDs;
  getFeed2({required this.postNIDs});
  
  @override
  Widget build(BuildContext context) {
    CollectionReference posts=FirebaseFirestore.instance.collection('NoticePosts');

    return FutureBuilder<DocumentSnapshot>(
      future: posts.doc(postNIDs).get(),
      builder: ((context, snapshot) {
         if(snapshot.connectionState==ConnectionState.done){
            
            Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic>;
            p.add('${data['image']}\n${data['group']}');
            return Column(
              children: [
                Container(child: Image.network('${data['image']}')),
                Container(child: Text('Uploaded By: ${data['email']}'),),
                Container(child: Text('Caption: ${data['Caption']}'),),
              ],
            );
            //('${data['name']}    Group: ${data['group']}');
         }
         return Text('Loading...');
  }   
  )
  );
  }
}


