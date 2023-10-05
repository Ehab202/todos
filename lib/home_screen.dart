import 'package:flutter/material.dart';
import 'package:todo/details.dart';
import 'package:todo/menu_screen.dart';
import 'package:todo/settings_screen.dart';


class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});
  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   late List<Widget> taps;


  int selectedTapIndex=0;

  @override
  Widget build(BuildContext context) {
    taps=[
      MenuScreen(),
      const SettingesScreen(),
    ];
    return Scaffold(
        body: taps[selectedTapIndex],
        bottomNavigationBar: BottomNavigationBarTheme(
          data: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(
              size: 30,
              color: Colors.blue,
            ),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
            size: 30,
          )
          ),
          child: BottomNavigationBar(
            onTap: (index) {
              selectedTapIndex=index;
              setState(() {});
            },
            currentIndex:selectedTapIndex,
            showUnselectedLabels: false,
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(icon:Icon(Icons.menu),label: "menu"),
              BottomNavigationBarItem(icon:Icon(Icons.settings),label: "settings")
            ]
            ),
        ),
        floatingActionButton: FloatingActionButton(
          shape:const CircleBorder(side: BorderSide(color: Colors.white),),
          onPressed: () {
           showModalBottomSheet(
            context: context,
            isScrollControlled:true ,
            builder: (context) {
              return Builder(
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const AddTask(),
                  );
                }
              );
            },);
          },
        heroTag:  Positioned(
            right: 6.0,
            bottom: 6.0,
            child: Container(
              width: 12.0,
              height: 12.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ),
          child:const Icon(Icons.add),
           ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    
      );
  }
}