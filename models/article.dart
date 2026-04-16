class Article {
  final int id;
  final String title;
  final String body;
  final String image;
  final String date;

  Article({
    required this.id,
    required this.title,
    required this.body,
    required this.image,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      image: "https://picsum.photos/200?random=${json['id']}",
      date: DateTime.now().toString(),
    );
  }
}