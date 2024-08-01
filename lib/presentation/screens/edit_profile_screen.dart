import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class EditProfileScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebase.User? user = firebase.FirebaseAuth.instance.currentUser;

    // Inicializar controladores con la información del usuario
    _nameController.text = user?.displayName ?? '';
    _emailController.text = user?.email ?? '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 147, 152),
        title: Text('Editar perfil', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              // Función para guardar la información del perfil
            },
            child: Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user?.photoURL ?? 'https://via.placeholder.com/150'),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: InkWell(
                onTap: () {
                  // Función para cambiar la foto de perfil
                },
                child: Text(
                  'Cambiar foto de perfil',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre y apellidos'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              readOnly: true, // Email no editable
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'ES'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Teléfono'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _genderController,
              decoration: InputDecoration(labelText: 'Género'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _dobController,
              decoration: InputDecoration(
                labelText: 'Fecha de nacimiento',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
                }
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
          ],
        ),
      ),
    );
  }
}
