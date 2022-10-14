import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationSevice{
  final FirebaseAuth _firebaseAuth;

  AuthenticationSevice(this._firebaseAuth);
 
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges(); 

  Future<String?> signIn({required String email, required String password})async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }
  Future<String?> signUp({required String email, required String password})async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "SignUp Complete";
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}