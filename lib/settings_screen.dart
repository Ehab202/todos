import 'package:flutter/material.dart';
import 'package:todo/details.dart';

class SettingesScreen extends StatelessWidget {
  const SettingesScreen({super.key});

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  AppBarBuild("To Do App"),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.12,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30,),
              const Expanded(
                child: SingleChildScrollView(child: Column(
                )),
              )
            ],
          ));
  }
}