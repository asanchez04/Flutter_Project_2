import 'package:flutter/material.dart';
import 'package:flutter_poo_api/views/listview_1.dart';
import 'package:flutter_poo_api/views/vista_firebase.dart';

class Menu extends StatefulWidget{
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuS createState()=> _MenuS();

}

class _MenuS extends State<Menu>{
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
    TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home',
    style: optionStyle),
    ShowDataBase(),
    ListView1(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Cat Wash'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red
             ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Car',
            backgroundColor: Colors.green
             ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
            backgroundColor: Colors.blueGrey
             ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
      );
  }

}