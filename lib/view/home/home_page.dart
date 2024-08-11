import 'package:bloc_clean_architecture/bloc/movie/movie_bloc.dart';
import 'package:bloc_clean_architecture/config/routes/route_name.dart';
import 'package:bloc_clean_architecture/main.dart';
import 'package:bloc_clean_architecture/services/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/response/status.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MovieBloc movieBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieBloc = MovieBloc(movieRepository: getItt1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => movieBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc clean architecture"),
          actions: [
            IconButton(
              onPressed: () async {
                LocalStorage localStorage = LocalStorage();
                await localStorage.clearValue('token').then((e) async {
                  await localStorage.clearValue('isLogin').then((e) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteName.login, (route) => false);
                  });
                });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocProvider(
            create: (_) => movieBloc..add(FetchMovie()),
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (BuildContext context, state) {
                switch (state.movieList.status) {
                  case Status.loading:
                    return const Center(child: CircularProgressIndicator());
                  case Status.error:
                    return const Text('ERROR');
                  case Status.completed:
                    if (state.movieList.data == null) {
                      // Widget for displaying no data found message
                      return Text('no data found');
                    }
                    final movieList = state.movieList.data!;

                    return ListView.builder(
                        itemCount: movieList.tvShow.length,
                        itemBuilder: (context, index) {
                          final tvShow = movieList.tvShow[index];
                          return Card(
                            child: ListTile(
                              leading: Image(
                                  image: NetworkImage(
                                      tvShow.imageThumbnailPath.toString())),
                              title: Text(
                                  tvShow.name.toString()), // Title of the movie
                              subtitle: Text(tvShow.network
                                  .toString()), // Network of the movie
                              trailing: Text(tvShow.status
                                  .toString()), // Status of the movie
                            ),
                          );
                        });
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
