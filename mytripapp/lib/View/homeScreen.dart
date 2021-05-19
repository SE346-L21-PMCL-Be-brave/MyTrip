import 'package:flutter/material.dart';
import 'package:mytripapp/View/Trip5.dart';
class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<homeScreen>{
  int _selectedPage =0;
  final _pageOption =[
    Trip5Screen(),
    Text('Item 2'),
    Text('Item 3'),
    Text('Item 4')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[_selectedPage] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.lightGreen[900]),
              title: Text('Home',style: TextStyle(color: Colors.lightGreen[900]))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.flight_takeoff,color: Colors.lightGreen[900]),
              title: Text('Trip',style: TextStyle(color: Colors.lightGreen[900]))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications,color: Colors.lightGreen[900]),
              title: Text('Notifications',style: TextStyle(color: Colors.lightGreen[900]))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,color: Colors.lightGreen[900]),
              title: Text('Profile',style: TextStyle(color: Colors.lightGreen[900]))
          )
        ],
      ),
    );
  }
}