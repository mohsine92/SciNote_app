import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  final Map article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Détail Article',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image ou logo en haut
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              child: Image.network(
                'https://i.pinimg.com/originals/18/d4/0c/18d40c585d4aec3e3cffe6286c9f6dd5.gif',
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    child: const Icon(
                      Icons.science,
                      size: 60,
                      color: Colors.black54,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article['nom'] ?? 'Nom non défini',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Publié par: ${article['auteur'] ?? 'Inconnu'}',
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Email: ${article['email'] ?? '-'}',
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Date: ${article['date_publication'] ?? '-'}',
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    article['description'] ?? '',
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black87, height: 1.5),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}