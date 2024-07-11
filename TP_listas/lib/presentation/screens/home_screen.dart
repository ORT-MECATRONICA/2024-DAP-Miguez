import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/Post.dart';

class HomeScreen extends StatelessWidget {
  final String usuario;
  const HomeScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    List<Post> posts = [
      Post(title: "SurfS kate", description: "Tabla para simular surf", imagesrc: "https://acdn.mitiendanube.com/stores/001/220/810/products/00-old-school-max-tunnel-02-e614d677da7c26ed4d17134742576550-1024-1024.jpg", text: "SurfSkate es una empresa californiana fundada en 2010, dedicada a fabricar patinetas que simulan la sensación de surfear.\nSus patinetas, diseñadas con un sistema de ejes innovador para giros cerrados y mayor control, son populares entre surfistas y skaters.\nLa compañía destaca por la calidad y durabilidad de sus productos, promoviendo eventos y competencias a nivel mundial."),
      Post(title: "Classic Skate", description: "Tablas para hacer trucos", imagesrc: "https://cdn.skatepro.com/product/520/enuff-classic-logo-complete-skateboard-3d.webp", text: "Classic Skate es una compañía de patinetas fundada en 1995 en California, Estados Unidos. Conocida por sus diseños retro y alta calidad, se especializa en patinetas clásicas para skaters de todas las edades.\nSus productos son populares en todo el mundo por su durabilidad y rendimiento."),
      Post(title: "LongBoard Skate", description: "Tablas para pasear", imagesrc: "https://imagedelivery.net/4fYuQyy-r8_rpBpcY7lH_A/falabellaPE/15846681_1/public", text: "LongBoard Skate es una empresa dedicada a la fabricación de patinetas largas. \n Fue fundada en 2005 en California, Estados Unidos, y su nombre refleja el tipo de patinetas que produce, diseñadas para mayor estabilidad y velocidad. \n Su principal producto son las patinetas longboard, populares entre los amantes del descenso y el cruising. \n Sus patinetas son reconocidas por su durabilidad y diseño innovador."),
      Post(title: "Penny Skate", description: "Tablas para facil transportacion", imagesrc: "https://acdn.mitiendanube.com/stores/069/005/products/pen-b-rojo11-56f4c9231d386ac17016224874059002-1024-1024.jpg", text: "Penny Skate es una compañía de patinetas australiana. \n Fue fundada en 2010 por Ben Mackay, y su nombre proviene del apodo de la esposa del fundador. \n Su principal producto son las patinetas de plástico de alta resistencia, conocidas por su tamaño compacto y ligereza. \n Son populares entre los skaters urbanos por su portabilidad y diseño colorido."),
     ];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hola $Usuario",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text("Logout"),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: posts.length * 100,
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.description),
                      onTap: () {
                        context.push(
                          '/card',
                          extra: {
                            'list': posts,
                            'pressed': index,
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
