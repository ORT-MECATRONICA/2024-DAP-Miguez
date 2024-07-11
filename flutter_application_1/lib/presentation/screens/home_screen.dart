import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final String usuario;
  const HomeScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    List<String> titulos = ["Classic Skate", "Surf Skate", "LongBoard Skate", "Penny Skate"];
    List<String> descripcion = ["Tablas para hacer trucos", "Tabla para simular surf", "Tablas para pasear", "Tablas para facil transportacion"];
    
      return Scaffold(
        /*body: ListView.builder(itemCount: titulos.length, itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(titulos[index],),
                    subtitle: Text(descripcion[index]),)
                );
              },),*/
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hola $usuario",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              ElevatedButton(
                onPressed: (){
                  context.go('/login');
                }, 
                child: const Text("Logout")
              ),
              SizedBox(height: 20), // Espacio deseado antes del ListView
              SizedBox(
                height: titulos.length * 100, // Define una altura adecuada
                child: ListView.builder(
                  itemCount: titulos.length,
                  itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(titulos[index]),
                      subtitle: Text(descripcion[index]),
                    ),
                  );
                },
              ),
              ),
            ],
          )
        )
    );
  }
}