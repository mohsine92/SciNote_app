import 'package:flutter/material.dart';
import 'article_page.dart'; 

void main() {
  runApp(const SciNoteApp());
}

class SciNoteApp extends StatelessWidget {
  const SciNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SciNote',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo depuis URL
              ClipRRect(
                borderRadius: BorderRadius.circular(50), // Cercle
                child: Image.network(
                  'https://i.pinimg.com/originals/18/d4/0c/18d40c585d4aec3e3cffe6286c9f6dd5.gif',
                  width: 115,
                  height: 115,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      child: const Icon(Icons.science, size: 60, color: Colors.black87),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'SciNote',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(221, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'The world explained, beautifully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Dive into the stories, ideas, and discoveries that shaped modern science. Each scientific research reveals a scientist, an innovation, and the hidden beauty of the universe that surrounds us.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ArticlePage(),
                    ),
                  );
                },
                child: const Text('Read'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}