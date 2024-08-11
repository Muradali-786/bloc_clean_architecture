import 'package:bloc_clean_architecture/config/app_url.dart';
import 'package:bloc_clean_architecture/data/network/network_api_services.dart';
import 'package:bloc_clean_architecture/model/movie/movie_model.dart';
import 'package:bloc_clean_architecture/respository/movie/movie_repository.dart';

class MovieHttpApi implements MovieRepository {
  final _api = NetworkApiServices();
  @override
  Future<MovieModel> movieRepository() async {
    final response = await _api.getApi(AppUrl.movieUrl).timeout(
          const Duration(seconds: 30),
        );

    return MovieModel.fromJson(response);
  }
}
