import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  final String uid;
  DatabaseService({this.uid}){
    _setCurrentUserData(uid);
  }

  final CollectionReference personCollection = 
      Firestore.instance.collection('persons');

  Future updateUserData(String uid,String email,String userName,var location, List toDoList,
      String newsPreference, bool mirrorStatus) async {
    return await personCollection.document(uid).setData({
      "uid":uid,
      "email":email,
      "name": userName,
      "location": location,
      'mirrorStatus': mirrorStatus,
      'newsPreference': newsPreference,
      'toDoList': toDoList,
    });
  }


  Future addNewTODO(List toDoList) async{
    return await personCollection.document(uid).setData({'toDoList': toDoList },merge: true);
  }


  Future updateNews(String newsPref) async{
    return await personCollection.document(uid).setData({'newsPreference': newsPref},merge: true);
  }

  Future updateLocation(dynamic location) async{
    return await personCollection.document(uid).setData({'location': location},merge: true);
  }

  var currentUserData;

  Future _setCurrentUserData(String uid) async {
    var status = await personCollection.getDocuments();
    
    for (var x in status.documents){
      if (x.data['uid'] == uid){
        currentUserData = x.data;
      }
    }
    return currentUserData;
  }

  Future updateData() async {
    return await _setCurrentUserData(uid);
  }




  Future updateWithUserData() async {
    return await personCollection.document(uid).setData({
      "uid":currentUserData["uid"],
      "email":currentUserData["email"],
      "name": currentUserData["name"],
      "location": currentUserData["location"],
      'mirrorStatus': currentUserData["mirrorStatus"],
      'newsPreference': currentUserData["newsPreference"],
      'toDoList': currentUserData["toDoList"],
    },merge: true);
  }


  Future toggleMirrorStatus() async {
    return await personCollection.document(uid).setData({'mirrorStatus': !currentUserData['mirrorStatus']},merge: true);
  }

  // person list from snapshot
  // Future getPersonData() async{
  //   return await personCollection.document(uid).get();
  // }

  // List<Person> _personListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return Person(
  //       name: doc.data['name'] ?? '',
  //       newsPreference: doc.data['newsPreference'] ?? '',
  //       location: doc.data['location'] ?? '',
  //       mirrorStatus: doc.data['mirrorStatus'] ?? false,
  //       toDoList: doc.data['toDoList'] ?? <String>[],
  //     );
  //   }).toList();
  // }

  // // get persons stream
  // Stream<QuerySnapshot> get persons {
  //   return personCollection.snapshots();
  // }

  // Stream<QuerySnapshot> get persons{
  //   return personCollection.snapshots();
  // }

}

// uid != doc.documentID ? null :
