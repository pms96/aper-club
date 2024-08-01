import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'edit_profile_screen.dart';  // Asegúrate de importar la pantalla de edición

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebase.User? user = firebase.FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user?.photoURL ?? 'https://via.placeholder.com/150'),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                user?.displayName ?? 'N/A',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: InkWell(
                onTap: () {
                  // Función para añadir la ubicación
                },
                child: Text(
                  'Añadir mi localización',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                },
                child: Text('Editar perfil'),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                title: Text('Nivel 2,05', style: TextStyle(color: Colors.green, fontSize: 20)),
                subtitle: Text('Fiabilidad del nivel: 27,06%', style: TextStyle(color: Colors.grey)),
                trailing: Chip(
                  label: Text('->', style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.blue,
                ),
                onTap: () {
                  // Función para más información
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
