import 'package:freezed_annotation/freezed_annotation.dart'; // Importing freezed_annotation package
part  'movie_model.g.dart';
part 'movie_model.freezed.dart';

/// Freezed class representing a list of movies.
@freezed
class MovieModel with _$MovieModel {
  /// Factory constructor for creating a [MovieModel] instance.
  factory MovieModel({
    @Default('') String total, // Total number of movies
    @Default(0) int page, // Current page number
    @Default(0) int pages, // Total number of pages
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow, // List of TV shows
  }) = _MovieModel; // Constructor for the freezed class

  /// Factory constructor for creating a [MovieModel] instance from JSON.
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json); // JSON deserialization method
}

/// Freezed class representing a TV show
@freezed
class TvShows with _$TvShows {
  /// Factory constructor for creating a [TvShows] instance.
  factory TvShows({
    @JsonKey(name: 'name') @Default('') String name, // Name of the TV show
    @Default('') String permalink, // Permalink of the TV show
    @Default('') String endDate, // End date of the TV show
    @Default('') String network, // Network of the TV show
    @JsonKey(name: 'image_thumbnail_path') @Default('') String imageThumbnailPath, // Image thumbnail path of the TV show
    @Default('') String status, // Status of the TV show
  }) = _TvShows; // Constructor for the freezed class

  /// Factory constructor for creating a [TvShows] instance from JSON.
  factory TvShows.fromJson(Map<String, dynamic> json) =>
      _$TvShowsFromJson(json); // JSON deserialization method
}