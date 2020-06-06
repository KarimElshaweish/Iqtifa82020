import 'package:firebase_auth/firebase_auth.dart';
import 'package:lqtifa/Model/User.dart';

class Auth{

  final FirebaseAuth auth=FirebaseAuth.instance;
  Future register(String email,String password)async{
    try{
      AuthResult result=await auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _UserFromFirebaseUser(user);
    }catch(e){
      print(e);
      return null;
    }
  }
  User _UserFromFirebaseUser(FirebaseUser user)=>user!=null?User(uid: user.uid):null;
  Future signIn(String email,String password)async{
    try{
      AuthResult result=await auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _UserFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOut()async{
    try{
      await auth.signOut();
      return "1";
    }catch(e){
      print(e);
      return null;
    }
  }
}