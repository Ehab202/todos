import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo_dm.dart';

class ListProvider extends ChangeNotifier{
List<TodoDm>todos=[];
DateTime selectedDate=DateTime.now();
  void getTodoslist()async{
    CollectionReference todoCollection=FirebaseFirestore.instance.collection("todos");
      QuerySnapshot querySnapshot=await todoCollection.orderBy(
        "date"
      ).get();
    List<QueryDocumentSnapshot>docs =querySnapshot.docs; 
    todos=docs.map((docSnapShot) {
      Map json= docSnapShot.data()as Map;
      return TodoDm(id: docSnapShot.id, data:DateTime.fromMillisecondsSinceEpoch(json["date"]) , description:json["details"], title:json["title"],isDone: json["isDone"] );
    } ).toList();
    todos.where((todo) {
      if (todo.data.year==selectedDate.year&& todo.data.month==selectedDate.month&&todo.data.day==selectedDate.day) {
        return true;
        
      }else {
        return false;
      }
    });
    
    notifyListeners();

    
  }
}