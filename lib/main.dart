import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(title: "Tung little 003", home: RandomWords());
  }
}

//v2
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _words = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();

    return Scaffold(
      appBar: AppBar(
        title: Text("Example for Statefull V2"),
        actions: <Widget>[
          IconButton(onPressed: _pushSaved, icon: const Icon(Icons.list))
        ],
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider();
          }
          if (index >= _words.length) {
            _words.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_words[index]);
        }),
      ),
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final bool alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final List<Widget> divided = ListTile.divideTiles(tiles: tiles, context: context).toList();
      return new Scaffold(
        appBar: AppBar(
          title: const Text("Save list"),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }
}
