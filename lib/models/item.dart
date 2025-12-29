// lib/item.dart
class Item {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double? price;
  final String? director;
  final int? year;
  final String? duration;
  final String? genre;
  final double? rating;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.price,
    this.director,
    this.year,
    this.duration,
    this.genre,
    this.rating,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id']?.toString() ?? '',
      title: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image'] ?? '',
      price: (json['price'] is num) ? (json['price'] as num).toDouble() : null,
      director: json['director'],
      year: json['year'],
      duration: json['duration'],
      genre: json['genre'],
      rating: (json['rating'] is num) ? (json['rating'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': title,
        'description': description,
        'image': imageUrl,
        'price': price,
        'director': director,
        'year': year,
        'duration': duration,
        'genre': genre,
        'rating': rating,
      };

  @override
  String toString() =>
      'Item(id: $id, title: $title, price: $price, image: $imageUrl, director: $director)';
}
