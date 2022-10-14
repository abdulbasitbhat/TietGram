
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';'
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/*void main(){
  runApp(MyApp());
}*/


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    
    return LoginWidget();
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var buttonName = 'Login';
  var buttonName2 = 'Sign Up';
  final emailController=TextEditingController();
  final passController=TextEditingController();
  @override
  void dispose(){
    emailController.dispose();
    passController.dispose();

    super.dispose();
  }
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passController.text.trim(),
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Home();
        }
        else{
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Container(
            margin:const EdgeInsets.all(0),
            
            child: Scaffold(
            backgroundColor: Color.fromARGB(255, 248, 245, 245),
            appBar: AppBar(
              title: const Center(
                child: Text('TietGram'),
              ),
            ),
    
          body: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Container(
                margin: const EdgeInsets.all(20),
                child:  Center(child: TextField(controller: emailController,
                decoration: InputDecoration(border: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 72, 77, 217),width:2.0),
                ), helperText: 'User Name'),)), 
              ),
              
               Container(
                margin: const EdgeInsets.all(20),
                child: Center(child: TextField(controller: passController,
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 72, 77, 217) ,width:2.0),
                ), helperText: 'Password'),))
              ),
               
               Container(
                margin: const EdgeInsets.all(10),
                child: Center(child: 
                Builder(
                  builder: (context) {
                    return ElevatedButton(onPressed: signIn
                    /*(){
                       /* Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
                          return Home();
                         },
                         ),
                        );*/
                        //signIn();
                    }*/
                     , child: Text(buttonName)
                      
                     );
                  }
                )
                 )
              ),
                 
                 Container(
                  margin: const EdgeInsets.all(10),
                  child: Center(child: 
                  Builder(
                    builder: (context) {
                      return ElevatedButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                        return Signup() ;
                      }
                      ),
                      );
                 },child: Text(buttonName2));
                    }
                  )
                  ),
                 ),
                 
                 Container(child: Center(
                   child: Builder(
                     builder: (context) {
                       return ElevatedButton(
                        child: Text('Forgot Password?'),
                        onPressed: (){},
                       );
                     }
                   ),
                 ))
             ],
    
             
           ),
           ),
          ), 
          ) 
        );
        }
      }
    );
  }

  
}