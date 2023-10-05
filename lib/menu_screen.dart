// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/date_piker.dart';
import 'package:todo/details.dart';
import 'package:todo/list_provider.dart';
import 'package:todo/todo_item.dart';

class MenuScreen extends StatefulWidget {

MenuScreen( {super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
 late ListProvider provider;
@override
  void initState() {

    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) { 
    provider.getTodoslist();
   });
   
  }
  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  AppBarBuild("To Do App"),
                  Padding(
                     padding: EdgeInsets.only(
                       top: height * 0.15,
                     ),
                     child: const DatePicker(),
                  )
                ],
              ),
              const SizedBox(height: 30,),
                  Expanded(
                child: SingleChildScrollView(child: Column(
                  children: [
                    ListView.builder(itemBuilder:(context, index) {
                      return TodoItem(todoDm: provider.todos[index]);

                    },
                    itemCount:provider.todos.length,)
                  ],
                )),
              )
            ],
          ));
  }

  
}