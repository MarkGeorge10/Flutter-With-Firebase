import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'crud.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  CRUD crud = new CRUD();
  QuerySnapshot querySnapshot;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState

    crud.getData().then((results){
      setState(() {

        querySnapshot = results;
        

        isLoading= true;

      });
    });
    super.initState();

  }
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
     if(isLoading){
       return Material(
           child:Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         child: ListView.builder(itemCount:querySnapshot.documents.length,
             itemBuilder: (BuildContext context, int index) {
               return ListTile(

                 title: Text(querySnapshot.documents[index].data['category'].toString()),
                 subtitle:Text(querySnapshot.documents[index].data['name'].toString()) ,

               );
             }),
       ));

    }
     else{
       return Material(
         child: Center(
           child: CircularProgressIndicator(),
         ),
       );
     }
  }
}
