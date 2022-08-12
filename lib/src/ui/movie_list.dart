import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('MovieList', name: 'BUILD WIDGET');
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          dev.log('MovieList', name: 'BUILD STREAM');
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    dev.log('MovieList..buildList()', name: 'BUILD WIDGET');
    return GridView.builder(
      itemCount: snapshot.data?.results.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data?.results[index].posterPath}',
            fit: BoxFit.cover,
          );
        });
  }
}
