// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'settings.dart';
import 'search.dart';
import 'homePage.dart';
import 'notice.dart';
import 'feed.dart';
import 'map.dart';
/*
void main() {
  runApp(const Home());
}
*/

class Home extends StatefulWidget {
 const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomePage();
}

class HomePage extends State<Home> {
  
  int cIndex=0;
  int currentIndex=0;
  final screens = [
    //Center(child: Text('Home')),
    Homepage(),
    //Center(child: Text('Search')),
    Search(),
    //Center(child: Text('Feed')),
    Feed(),
    //Center(child: Text('Notice Board')),
    Notice(),
    //Center(child: Text('Settings'))
    Settings(),
    //Map
    Map()
    
  ];
  void ChangeInd(int index){      // a setter function we made for indes change using bottom nav bar item click as it has inbuilt varible of name
    setState(() {
      currentIndex=index;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Container(
       // margin:const EdgeInsets.all(10),
        child: 
      Scaffold(
        body: screens[currentIndex],
        appBar: PreferredSize(child: AppBar(
          title: const Center(
            child: Text('TietGram'),
          ),
        ),
        preferredSize: Size.fromHeight(30),
        ),
  
       bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
            ChangeInd(index);
        },
        backgroundColor: const Color.fromARGB(255, 233, 239, 234),
        selectedItemColor:const  Color.fromARGB(255, 58, 191, 94),
        unselectedItemColor: const Color.fromARGB(255, 54, 85, 172),
        currentIndex: currentIndex,            //Using this line the particular element gets highlighted.
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Community',                        //change to Search when Search feature implemented
              icon: Icon(Icons.search_sharp),
              ),
            BottomNavigationBarItem(
              label: 'Feed',
              icon: Icon(Icons.featured_play_list_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Notice Board',
              icon: Icon(Icons.border_all_rounded),
              ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings,),
            ),
            BottomNavigationBarItem(
              label: 'Map',
              icon: Icon(Icons.map)
            )
          ],
        ),
      ),
      ) 
    );
  }
}
