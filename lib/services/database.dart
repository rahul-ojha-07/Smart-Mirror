import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:smartMirror/models/person.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference personCollection = 
      Firestore.instance.collection('persons');

  Future updateUserData(String uid,String email,String userName, String location, List<String> toDoList,
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

  // person list from snapshot
  // Future getPersonData() async{
  //   return await personCollection.document(uid).get();
  // }

  List<Person> _personListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Person(
        name: doc.data['name'] ?? '',
        newsPreference: doc.data['newsPreference'] ?? '',
        location: doc.data['location'] ?? '',
        mirrorStatus: doc.data['mirrorStatus'] ?? false,
        toDoList: doc.data['toDoList'] ?? <String>[],
      );
    }).toList();
  }

  // get persons stream
  Stream<List<Person>> get persons {
    return personCollection.snapshots().map((sapshot) {
      print(sapshot);
      return _personListFromSnapshot(sapshot);
    });
  }

  // Stream<QuerySnapshot> get persons{
  //   return personCollection.snapshots();
  // }

}

// uid != doc.documentID ? null :
