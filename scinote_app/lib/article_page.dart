import 'package:flutter/material.dart';
import 'api_service.dart'; // Ton service pour récupérer les articles
import 'article_detail_page.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  List articles = [];
  bool isLoading = true;

  final ScrollController _scrollController = ScrollController();
  int page = 1; // Pagination
  bool isFetchingMore = false;

  @override
  void initState() {
    super.initState();
    fetchArticles();
    _scrollController.addListener(_onScroll);
  }

  Future<void> fetchArticles() async {
    try {
      final data = await ApiService().getArticles(page: page);
      setState(() {
        articles.addAll(data);
        isLoading = false;
        isFetchingMore = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        isFetchingMore = false;
      });
      debugPrint('Erreur récupération articles : $e');
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.8 &&
        !isFetchingMore) {
      setState(() => isFetchingMore = true);
      page++;
      fetchArticles();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7), // Gris clair iOS
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Derniers Articles',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ArticleDetailPage(article: article),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article['nom'] ?? 'Nom non défini',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          article['description'] ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black87, height: 1.4),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Publié par ${article['auteur'] ?? 'Inconnu'}',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}