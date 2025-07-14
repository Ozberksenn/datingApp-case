class MovieModel {
  final String id;
  final String? title;
  final String? year;
  final String? poster;
  final bool? isFavorite;
  final String? plot;
  final List<String>? images;

  MovieModel({
    required this.id,
    this.title,
    this.year,
    this.poster,
    this.isFavorite,
    this.plot,
    this.images,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['Title'],
      year: json['Year'],
      poster: json['Poster'],
      isFavorite: json['isFavorite'],
      plot: json['Plot'],
      images: (json['images'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'poster': poster,
      'isFavorite': isFavorite,
      'plot': plot,
      'Images': images,
    };
  }
}
