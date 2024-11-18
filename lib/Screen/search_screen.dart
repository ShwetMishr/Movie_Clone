import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/Widgets/movie_card.dart';
import 'dart:convert';
import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List movies = [];
  TextEditingController searchController = TextEditingController();

  searchMovies(String query) async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
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
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search for movies...",
          ),
          onSubmitted: (value) {
            searchMovies(value);
          },
        ),
      ),
      body: movies.isEmpty
          ? Center(child: Text("Search for movies"))
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
