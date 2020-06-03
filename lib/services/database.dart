import 'package:cloud_firestore/cloud_firestore.dart';



class DatabaseService{

  final String uid;
  DatabaseService( { this.uid } );

  final CollectionReference personCollection = Firestore.instance.collection('persons');


  Future updateUserData(String userName,String location,List<String> toDoList ,String newsPreference, bool mirrorStatus) async{

    return await personCollection.document(uid).setData({
      "name":userName,
      "location":location,
      'mirrorStatus':mirrorStatus,
      'newsPreference':newsPreference,
      'toDoList' : toDoList,
    });



  }

}