import 'package:flutter/material.dart';
import 'package:my_movie_list/models/movie_type.dart';
import 'package:my_movie_list/widgets/section_title.dart';
import 'package:my_movie_list/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomeScreen());
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SectionTitle(
                  title: 'Popular Movies', movieType: MovieType.Popular),
              PopularMovies(),
              SectionTitle(title: 'Top Rated', movieType: MovieType.TopRated),
              TopRatedMovies(),
              SectionTitle(title: 'Upcoming', movieType: MovieType.Upcoming),
              UpcomingMovies(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
