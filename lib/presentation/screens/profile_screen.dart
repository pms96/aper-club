import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/usecases/auth_usecase.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authUseCase = Provider.of<AuthUseCase>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),  // Reemplaza con la URL de la foto del usuario
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: () {
                      // Funcionalidad para cambiar la foto
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'First Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Last Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'email@example.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await authUseCase.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,  // Botón de logout en rojo
            ),
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white)
            ),
          ),
        ],
      ),
    );
  }
}
