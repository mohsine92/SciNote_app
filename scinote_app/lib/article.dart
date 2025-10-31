class Article {
  final int id;
  final String nom;
  final String description;
  final String auteur;
  final String email;
  final String datePublication;

  Article({
    required this.id,
    required this.nom,
    required this.description,
    required this.auteur,
    required this.email,
    required this.datePublication,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: int.parse(json['id'].toString()),
      nom: json['nom'] ?? '',
      description: json['description'] ?? '',
      auteur: json['auteur'] ?? '',
      email: json['email'] ?? '',
      datePublication: json['date_publication'] ?? '',
    );
  }
}