class MovieModel {
  final String id;
  final String? title;
  final String? director;
  final String? year;
  final String? poster;
  final bool? isFavorite;
  final String? plot;
  final List<String>? images;

  MovieModel({
    required this.id,
    this.title,
    this.director,
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
      director: json['Director'],
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
      'Director': director,
      'year': year,
      'poster': poster,
      'isFavorite': isFavorite,
      'plot': plot,
      'Images': images,
    };
  }

  MovieModel copyWith({
    String? id,
    String? title,
    String? director,
    String? year,
    String? poster,
    bool? isFavorite,
    String? plot,
    List<String>? images,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      director: director ?? this.director,
      year: year ?? this.year,
      poster: poster ?? this.poster,
      isFavorite: isFavorite ?? this.isFavorite,
      plot: plot ?? this.plot,
      images: images ?? this.images,
    );
  }
}
