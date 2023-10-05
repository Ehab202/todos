import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/list_provider.dart';

// ignore: must_be_immutable
class AppBarBuild extends StatelessWidget {
  AppBarBuild(this.title, {super.key});
  String title;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.15,
      width: double.infinity,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 40),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Add New Task",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                  controller: title,
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  validator: (String) {
                    return String?.isEmpty == true
                        ? "please enter task  title"
                        : null;
                  },
                  decoration: const InputDecoration(
                      labelText: "enter your task",
                      errorStyle: TextStyle(fontSize: 12))),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                  controller: details,
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  validator: (String) {
                    return String?.isEmpty == true
                        ? "please enter task  details"
                        : null;
                  },
                  decoration: const InputDecoration(
                      labelText: "details",
                      errorStyle: TextStyle(fontSize: 12))),
              const SizedBox(
                height: 10,
              ),
              const Text("Select Day",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showMydatapiker(context);
                },
                child: Text(
                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}/${selectedDate.hour}/${selectedDate.minute}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    addtask();
                  },
                  child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
  void showMydatapiker(BuildContext context) async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }
  
  void addtask()async {
    if (_key.currentState!.validate()) {
   CollectionReference todoCollection= FirebaseFirestore.instance.collection("todos");
   DocumentReference newDoc= todoCollection.doc();
   newDoc.set({
    "id":newDoc.id,
    "title":title.text,
    "details":details.text,
    "date":selectedDate.microsecondsSinceEpoch,
    "isDone": false
   }).timeout(const Duration(milliseconds: 500),onTimeout: () {
     Navigator.pop(context);
     ListProvider provider= Provider.of(context,listen: false);
     provider.getTodoslist();
   },);
  
   


      
    }
  }
}