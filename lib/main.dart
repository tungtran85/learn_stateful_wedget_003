import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "Tung little 003",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Example for Statefull V2"),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

//v2
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _words = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return ListView.builder(itemBuilder: (context, index) {
      if (index >= _words.length) {
        _words.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_words[index]);
    });
  }

  Widget _buildRow(WordPair wordPair) {
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}

//v1---------------------------------------
class RandomWords1 extends StatefulWidget {
  @override
  RandomWordsState1 createState() => new RandomWordsState1();
}

class RandomWordsState1 extends State<RandomWords1> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
