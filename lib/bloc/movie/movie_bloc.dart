import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture/data/response/api_response.dart';
import 'package:equatable/equatable.dart';

import '../../model/movie/movie_model.dart';
import '../../respository/movie/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepository movieRepository;
  MovieBloc({required this.movieRepository})
      : super(MovieState(movieList: ApiResponse.loading())) {
    on<FetchMovie>(movieApiResponse);
  }

  void movieApiResponse(FetchMovie event, Emitter<MovieState> emit) {
    movieRepository.movieRepository().then((value) {
      emit(state.copyWith(apiResponse: ApiResponse.complete(value)));
    }).onError((error, stackTrace) {
      emit(state.copyWith(apiResponse: ApiResponse.error(error.toString())));
    });
  }
}
