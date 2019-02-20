import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
	RandomWords({Key key, this.title}) : super(key: key);
	final String title;
	@override
	createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
	// Dart语言中，使用下划线前缀标识符，会强制其变成私有的
	final _suggestions = <WordPair>[];
	final _saved = Set<WordPair>();
	final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(widget.title),
				actions: <Widget> [
					IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
				],
			),
			body: _buildSuggestions(),
		);
	}

	void _pushSaved() {
		Navigator.of(context).push(
			MaterialPageRoute(
				builder: (context) {
					final tiles = _saved.map((pair) {
						return ListTile(
							title: Text(
								pair.asPascalCase,
								style:_biggerFont,
							),
						);
					});

					final divided = ListTile.divideTiles(
						tiles: tiles,
						context: context
					).toList();

					return Scaffold(
						appBar: AppBar(
							title: Text('Saved Suggestions'),
						),
						body: ListView(children: divided)
					);
				}
			)
		);
	}

	Widget _buildSuggestions() {
		return ListView.builder(
			padding: const EdgeInsets.all(16.0),
			// 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
			// 在偶数行，为单词对添加一个ListTile row.
			// 在奇数行，添加一个分割线
			itemBuilder: (context, i) {
				// 在每一行之前，添加一个1像素高的分割线
				if (i.isOdd) return Divider();

				// 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5，
				// 结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
				final index = i ~/ 2;
				// 如果是建议列表中最后一个单词对
				if (index >= _suggestions.length) {
					// 接着再生成10个单词对，然后添加到建议列表
					_suggestions.addAll(generateWordPairs().take(10));
				}
				return _buildRow(_suggestions[index]);
			},
		);
	}

	Widget _buildRow(WordPair pair) {
		final alreadySaved = _saved.contains(pair);
		return ListTile (
			title: Text (
				pair.asPascalCase,
				style: _biggerFont,
			),
			trailing: Icon(
				alreadySaved ? Icons.favorite : Icons.favorite_border,
				color: alreadySaved ? Colors.red : null,
			),
			onTap: () {
				setState(() {
					if (alreadySaved) {
						_saved.remove(pair);
					} else {
						_saved.add(pair);
					}
				});
			},
		);
	}
}