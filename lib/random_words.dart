import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import './saved_words.dart';


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}


class RandomWordsState extends State<RandomWords> {
  final hearted = Set<WordPair>();
  final wordlist = <WordPair>[];

  Widget _buildList()
  {

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= wordlist.length)
        {
          wordlist.addAll(generateWordPairs().take(10));
        }
        return _buildRow(wordlist[index]);
      }
    );
  }


  Widget _buildRow(WordPair pair)
  {
    bool isFav = hearted.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18.0)
      ),
      trailing: Icon(
        isFav ? Icons.favorite: Icons.favorite_border,
        color: isFav ? Colors.red: null,
      ),
      onTap: () {
        setState(() {
          if (isFav)
          {
            hearted.remove(pair);
          }
          else
          {
            hearted.add(pair);
          }
        });
      },
      
    );
  }

  void _newPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return savedWordsBuilder(context, hearted);
        }
      )
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'),
        actions: <Widget>[
          IconButton(
            onPressed: _newPage,
            icon: Icon(Icons.list)
          )
        ],
      ),
      body: _buildList()
    );
  }
}