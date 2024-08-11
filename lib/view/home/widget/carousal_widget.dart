import 'package:bloc_clean_architecture/model/movie/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../../config/color/app_color.dart';

class CarousalWidget extends StatefulWidget {
  final MovieModel movieModel;
  const CarousalWidget({super.key, required this.movieModel});

  @override
  State<CarousalWidget> createState() => _CarousalWidgetState();
}

class _CarousalWidgetState extends State<CarousalWidget> {
  final _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: FlutterCarousel(
            options: CarouselOptions(
              height: 500.0,
              aspectRatio: 16 / 9,
              viewportFraction: 0.7,
              enlargeCenterPage: true,
              showIndicator: true,
              controller: _controller,
              slideIndicator: const CircularSlideIndicator(),
            ),
            items: widget.movieModel.tvShow.map((movie) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                movie.imageThumbnailPath.toString(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          movie.name.toString(),
                          style: const TextStyle(
                              color: kWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.w900),
                        ),
                      )
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text('view all'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: widget.movieModel.tvShow.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final map = widget.movieModel.tvShow[index];

                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 120,
                    width: 150,
                    child: Image(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(map.imageThumbnailPath)),
                  );
                }),
          ),
        )
      ],
    );
  }
}
