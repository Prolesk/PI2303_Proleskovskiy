import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Фотогалерея', home: MyHomePage());
  }
}

class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/photos?_limit=50'),
  );

  if (response.statusCode == 200) {
    return parsePhotos(response.body);
  } else {
    throw Exception('Ошибка загрузки');
  }
}

List<Photo> parsePhotos(String responseBody) {
  final List<dynamic> parsed = jsonDecode(responseBody);
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Фотогалерея', style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});
  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: GridTile(
            footer: Container(
              color: Colors.black54,
              padding: const EdgeInsets.all(4),
              child: Text(
                photo.title,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            child: Image.network(
              photo.thumbnailUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
