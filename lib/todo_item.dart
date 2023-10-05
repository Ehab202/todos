import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/edit_screen.dart';
import 'package:todo/list_provider.dart';
import 'package:todo/todo_dm.dart';

// ignore: must_be_immutable
class TodoItem extends StatelessWidget {
  
  TodoItem({super.key,required this.todoDm});
   TodoDm todoDm;

  @override
  Widget build(BuildContext context) {
   ListProvider provider = Provider.of<ListProvider>(context,listen: false);
    return Slidable(
      startActionPane: ActionPane(  
        motion: const DrawerMotion(),
        extentRatio: .2,
         children: [
          SlidableAction(
        onPressed:(context)async {
          await FirebaseFirestore.instance.collection("todos").doc(todoDm.id).delete().timeout(const Duration(milliseconds: 400),onTimeout: () {
          provider.getTodoslist(); 
          });
        },
        backgroundColor: const Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
          ),
           SlidableAction(
        onPressed:(context) {
           Navigator.pushNamed(context,EditScreen.routeName);
        },
        backgroundColor: const Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: 'Edit',)
         ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
           color: Colors.white,
           
          ),
         
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10,),
              Padding( 
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width:3,
                  height:double.infinity ,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 10,),
               Column(
                crossAxisAlignment:CrossAxisAlignment.center ,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(todoDm.title,style: const TextStyle(color: Colors.blue,fontSize: 15),),
                  const SizedBox(height: 8,),
                     Text(todoDm.description,style: const TextStyle(color: Colors.blue,fontSize: 15),)
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      
                    },
                     icon: const Icon(Icons.check)),
                ),
              )
            ],
          ),
      
        ),
      ),
    );
  }
}