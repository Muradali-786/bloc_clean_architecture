import '../../model/movie/movie_model.dart';

abstract class MovieRepository {
  Future<MovieModel> movieRepository();
}
