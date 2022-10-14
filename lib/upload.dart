import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';
import 'home.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final cap=TextEditingController();
   void dispose(){
    cap.dispose();
    super.dispose();
  }

  Future getCap()async{
    String c=await cap.text.toString();
    return c;
  }
  //PlatformFile? pickedFile;
  //final result;
  XFile? pickedFile;
  File? image; 
  UploadTask? uploadTask;
  //var urlDownload='hii';
  Future selectFile() async{
    final pickfile=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 80);
    setState(() {
      if(pickfile==null) return;
    else {pickedFile=pickfile;
       image=File(pickedFile!.path) ;
    }
    });
  }
    Future uploadFile() async{
      final path='Images/${pickedFile!.name}';
      final file= File(pickedFile!.path);

      final reff=FirebaseStorage.instance.ref().child(path).putFile(file);
      //ref.putFile(file);

      /*final snapshot=await uploadTask!.whenComplete((){});
      urlDownload = await snapshot.ref.getDownloadURL().toString();
      print(urlDownload);*/

      //------------------
      /*final snapshot=await uploadTask!.whenComplete((){});
      final urlDownload = await snapshot.ref.getDownloadURL();*/
      var snapshot=await reff;
      var urlDownload=await snapshot.ref.getDownloadURL();
      //String url=urlDownload.toString();
      print('Download:$urlDownload');
      return urlDownload;
      //-------------------
    /* var url=(await uploadTask!.whenComplete((){})).ref.getDownloadURL();
     var urlDownload=url.toString();*/


      //
     /* FirebaseAuth auth = FirebaseAuth.instance;
  String uid= await auth.currentUser!.uid.toString();
 // var coll = FirebaseFirestore.instance.collection('posts');
  var coll =await  FirebaseFirestore.instance.collection('posts').doc(pickedFile!.name);
  int count=0;
  //coll.doc(uid).set({'image':urlDownload});
  coll.set({'image':urlDownload});*/
  //
     // return urlDownload;
    }
    /*getUrl() async{
      final ref=FirebaseStorage.instance.ref().child('Images/${pickedFile!.name}');
      String url= (await ref.getDownloadURL()).toString();
      print(url);
      return url;
    }*/

  Future addDat2(urlDownload,capp) async{                //Causing Error
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid= auth.currentUser!.uid.toString();
  String em=auth.currentUser!.email.toString();
 // var coll = FirebaseFirestore.instance.collection('posts');
  var coll = FirebaseFirestore.instance.collection('posts').doc(pickedFile!.name);
  int count=0;
  //DateTime dateToday=DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  //coll.doc(uid).set({'image':urlDownload});
 coll.set({'image':urlDownload,'by':uid.toString(),'date-time':FieldValue.serverTimestamp(),'email':em,'Caption':capp.toString()});
}

Future addDat2N(urlDownload,capp) async{                //Causing Error
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid= auth.currentUser!.uid.toString();
  String em=auth.currentUser!.email.toString();
 // var coll = FirebaseFirestore.instance.collection('posts');
  var coll = FirebaseFirestore.instance.collection('NoticePosts').doc(pickedFile!.name);
  int count=0;
  //DateTime dateToday=DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  //coll.doc(uid).set({'image':urlDownload});
 coll.set({'image':urlDownload,'by':uid.toString(),'date-time':FieldValue.serverTimestamp(),'email':em,'Caption':capp.toString()});
}

/*
final postRef= FirebaseFirestore.instance.collection('posts');
creatPostInFirestor({String ? mediaUrl, String? location,String? description}){
  postRef.doc(FirebaseAuth.instance.currentUser!.uid).collection('posts').doc(postID).
}*/
    
    //else image=File(pickfile,path);
    /*final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png','jpg','jpeg'],
    );
    if(result ==null) return;
    setState(() {
      pickedFile = result.files.first;
    }
    );
    final path=result.files.single.path;
    final filename=result.files.single.name;
    print(path);
    print(filename);*/
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
        ),
      body: Column(
      children: [
        
       if(pickedFile!=null)

         Container(
           child: Expanded(child: Container(
            child: Center(child: 
            image != null ? Image.file(image!.absolute) : Center(child: Text('Image'))
            //Text(pickedFile!.name)
            ),
           ),
           ),
         ),

        Container(
          child: Center(
            child: ElevatedButton(
              onPressed: selectFile/*() async {
                 //selectFile();
                 final res= await FilePicker.platform.pickFiles();
              }*/,
              child: Text('Select Image'),
            ),
          )
        ),
       
        Container(child: TextField(
          controller: cap,
          decoration: InputDecoration(
             helperText: 'Caption',
                      border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                      ),
          ),

        ),
        ),
         Container(
          child: Center(
            child: ElevatedButton(
              onPressed: ()async{
                //var url=uploadFile();
                //var url=;
                //print(url);
    
                //addDat2((await uploadFile()),await cap);  //Causes error
                addDat2(await uploadFile(),await getCap());
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return Home();
                }
                )
                );
                
              },
              child: Text('Upload'),
            ),
          )
        ),
        Container(
          child: Center(
            child: ElevatedButton(
              onPressed: ()async{
                //var url=uploadFile();
                //var url=;
                //print(url);
    
                //addDat2((await uploadFile()),await cap);  //Causes error
                addDat2N(await uploadFile(),await getCap());
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return Home();
                }
                )
                );
                
              },
              child: Text('Upload On Notice Board'),
            ),
          )
        ),
      ]
    ),
    );
  }
}

