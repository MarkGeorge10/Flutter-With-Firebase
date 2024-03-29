import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUD{

  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser() != null ){
      return true;
    }
      else{
        return false;
    }
  }


  Future<void> addData(data) async
  {
    if(isLoggedIn()) {
      Firestore.instance.collection("testcrud").add(data).catchError((e) {
        print(e);
      });
    }
    else{
      print("You need to loggned in");
    }
  }

  getData()async{
    return await Firestore.instance.collection("testcrud").getDocuments();
  }


}