import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/movie/movie_bloc.dart';
import '../../../config/components/internet_exception.dart';
// Importing the InternetExceptionWidget

/// A widget for displaying error messages related to movies.
class MoviesErrorWidget extends StatelessWidget {
  const MoviesErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) => previous.movieList != current.movieList,
      builder: (context, state) {
        // Checking if the error message indicates no internet connection
        if (state.movieList.message.toString() == 'no internet connection') {
          // Displaying InternetExceptionWidget if there's no internet connection
          return InternetException(onTap: () {
            // Dispatching PostFetched event to trigger fetching movies data
            context.read<MovieBloc>().add(FetchMovie());
          });
        } else {
          // Displaying error message as a clickable text if it's not related to internet connection
          return InkWell(
            onTap: () {
              // Dispatching PostFetched event to trigger fetching movies data
              context.read<MovieBloc>().add(FetchMovie());
            },
            child: Center(
              child: Text(state.movieList.message.toString()),
            ),
          );
        }
      },
    );
  }
}
