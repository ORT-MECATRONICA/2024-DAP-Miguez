import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/entities/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

List<Post> posts = [];

class MoviesNotifier extends StateNotifier {
  MoviesNotifier() : super([]);

  Future<void> addMovie(List<Post> equipos) async {
    final doc = db.collection('surfistas').doc('surfistas');
    try {
      var upload = <String, dynamic>{};
      for (var equipo in equipos) {
        upload[equipo.title] = [
          equipo.description,
          equipo.text,
          equipo.imagesrc
        ];
      }
      await doc.set(upload);
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Post>> getMovies() {
    return db.collection('surfistas').doc('surfistas').snapshots().map((snapshot) {
      posts = [];
      var data = snapshot.data();
      for (var element in data!.entries) {
        posts.add(Post(
            title: element.key,
            description: element.value[0],
            text: element.value[1],
            imagesrc: element.value[2]));
      }
      posts = posts.reversed.toList();
      
      return posts;
    });
  }
}

/*List<Post> posts = [
      Post(title: "River", description: "71 Titulos Profesionales", imagesrc: "https://upload.wikimedia.org/wikipedia/commons/3/3f/Logo_River_Plate.png", text: "El Club Atlético River Plate es un entidad polideportiva de Argentina. \n Fue fundado el 25 de mayo de 1901 en el barrio de La Boca, tras la fusión de los clubes Santa Rosa y La Rosales, y su nombre proviene de la antigua denominación que se le daba en el inglés británico al Río de la Plata. \n Su principal actividad es el fútbol masculino profesional, el cual participa en la Primera División de Argentina. Disputa sus partidos en el estadio Monumental, el de mayor capacidad en Sudamérica; y el segundo en el continente con una capacidad para 84.567 espectadores"),
      Post(title: "Boca", description: "68 Titulos Profesionales", imagesrc: "https://upload.wikimedia.org/wikipedia/commons/c/c9/Boca_escudo.png", text: "El Club Atlético Boca Juniors es una entidad deportiva argentina, con sede en el barrio de La Boca, Ciudad Autónoma de Buenos Aires. Fue fundado el 3 de abril de 1905 por seis vecinos adolescentes hijos de italianos. \n El fútbol masculino es su disciplina más destacada, que se desempeña en la Primera División de Argentina, aunque también compite a nivel profesional, nacional e internacionalmente, en baloncesto, voleibol, futsal, fútbol femenino y balonmano mientras que deportes como el boxeo, judo, karate, taekwondo, gimnasia rítmica, gimnasia artística y hockey se practican a nivel amateur."),
      Post(title: "Independiente", description: "43 Titulos Profesionales", imagesrc: "https://www.topmercato.com/wp-content/uploads/2024/02/independiente.png", text: "El Club Atlético Independiente, o simplemente Independiente, es una entidad deportiva y educativa argentina, cuya sede y estadio están localizados en la ciudad de Avellaneda, del aglomerado del Gran Buenos Aires. El club es reconocido principalmente por su fútbol profesional, que milita en la Primera División de Argentina y es considerado como uno de los cinco grandes del fútbol argentino."),
      Post(title: "Racing", description: "30 Titulos Profesionales", imagesrc: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Escudo_de_Racing_Club_%282014%29.svg/132px-Escudo_de_Racing_Club_%282014%29.svg.png", text: "El Racing Club, conocido popularmente como la Academia es una entidad polideportiva argentina, con sede en Avellaneda, Provincia de Buenos Aires. Fue fundado como club de fútbol el 25 de marzo de 1903. Según el ranking del IFFHS (2022-2023), es el tercer club argentino con mayor puntaje, el vigésimo de Sudamérica y el 87º del mundo."),
      Post(title: "San Lorenzo", description: "19 Titulos Profesionales", imagesrc: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Escudo_del_Club_Atl%C3%A9tico_San_Lorenzo_de_Almagro.svg/160px-Escudo_del_Club_Atl%C3%A9tico_San_Lorenzo_de_Almagro.svg.png", text: "El Club Atlético San Lorenzo de Almagro, mayormente conocido como San Lorenzo, es una entidad deportiva de Buenos Aires, Argentina. Fue fundado el 1 de abril de 1908 por iniciativa de un grupo de jóvenes con la colaboración del sacerdote salesiano Lorenzo Massa. Su principal actividad es el fútbol masculino donde participa en la Primera División. También en el club se practica Balonmano, Baloncesto, Futsal, Gimnasia rítmica, Natación, y Hockey entre otras disciplinas deportivas.")
    ];
*/
int pressed = -1;

final listProvider = StreamProvider((ref) => MoviesNotifier().getMovies());
final listaddProvider = Provider((ref) => MoviesNotifier());

final pressedProvider = StateProvider((ref) {
  return pressed;
});
