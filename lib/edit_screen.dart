import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
static const String routeName="Edit Screen";

  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Edit Task"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(25),
        child: Card(
          elevation: 5,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white)),
          child: Column(
            children: [
              TextFormField(),
            const Spacer(flex:2 ,),
              TextFormField(),
              const Spacer(flex: 2,),
              const Text("Select time",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
               const Spacer(flex: 1,),
              const Text("Date"),
              const Spacer(flex: 2,),
              ElevatedButton(
                onPressed: (){},
                 child: const Text("Save Edit")),
                 const Spacer()
        
        
            ],
          ),
        ),
      ),
    );
  }
}