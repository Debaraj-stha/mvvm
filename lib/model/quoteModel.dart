class Quote {
  String quote;
  String author;
  int id;
  Quote({required this.author, required this.id, required this.quote});
  factory Quote.fromJson(Map<String, dynamic> json) =>
      Quote(id: json['id'], author: json['author'], quote: json['quote']);
  Map<String, dynamic> toJson() => {"id": id, "author": author, "quote": quote};
}
