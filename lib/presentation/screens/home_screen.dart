import 'package:flutter/material.dart';
import 'profile_screen.dart';  // Asegúrate de importar la pantalla de perfil

class HomeScreen extends StatefulWidget {
  final String userName;

  HomeScreen({required this.userName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    ProfileScreen(),  // Añadir la pantalla de perfil aquí
    Center(child: Text('Settings Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.userName}'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,  // Diferenciar las secciones no seleccionadas
        backgroundColor: Colors.black,  // Tono más oscuro
        onTap: _onItemTapped,
      ),
    );
  }
}
