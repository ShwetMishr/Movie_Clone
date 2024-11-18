import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/Widgets/movie_card.dart';
import 'dart:convert';
import 'details_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  fetchMovies() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    if (response.statusCode == 200) {
      setState(() {
        movies = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      body: movies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
             itemCount: movies.length,
             itemBuilder: (context, index) {
               final movie = movies[index]['show'];
               return MovieCard(
                  image: movie['image']?['medium'] ?? '',
                  title: movie['name'],
                  summary: movie['summary'],
                  onTap: () {
                     Navigator.push(
                  context,
                     MaterialPageRoute(
                     builder: (context) => DetailsScreen(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
