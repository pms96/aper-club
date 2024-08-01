import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';  // Asegúrate de importar la pantalla de configuración

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
    ProfileScreen(),
    SettingsScreen(),
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
        backgroundColor: Color.fromARGB(255, 56, 147, 152), // Fondo oscuro
        title: Row(
          children: [
            Text(
              'Hola ${widget.userName}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(width: 4),
            Icon(Icons.sports_tennis, color: Colors.yellow, size: 24),  // Icono de saludo
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Lógica para notificaciones
            },
          ),
        ],
        automaticallyImplyLeading: false,
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
        selectedItemColor: Color.fromARGB(255, 56, 147, 152),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
