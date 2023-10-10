import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './random_words.dart';


Widget savedWordsBuilder(BuildContext context, Set<WordPair> saved)
{
  final Iterable<ListTile> tiles = saved.map((item) {
    return ListTile(
      title: Text(
        item.asCamelCase,
        style: TextStyle(fontSize: 16.0)
      )
    );
  });

  final List<Widget> dividedRows = ListTile.divideTiles(
    context: context,
    tiles: tiles
  ).toList();

  return Scaffold(
    appBar: AppBar(
      title: Text("Favorite Words"),
    ),
    body: ListView(
      children: dividedRows,
    ),
  );
}