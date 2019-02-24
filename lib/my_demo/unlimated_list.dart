import 'dart:async';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
	RandomWords({Key key, this.title}) : super(key: key);
	final String title;
	@override
	createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
	static const String loadingTag = '没有了！';
	static const Widget diver1 = Divider(color: Colors.grey);

	// Dart语言中，使用下划线前缀标识符，会强制其变成私有的
	final _suggestions = <String>[loadingTag];
	final _saved = Set<String>();
	final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

	@override
	void initState() {
		super.initState();
		_retrieveData();
	}

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
							title: Text(pair, style:_biggerFont)
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

	void _retrieveData() {
		Future.delayed(Duration(seconds: 1)).then((e) {
			_suggestions.insertAll(
				_suggestions.length - 1,
				generateWordPairs().take(10).map((e) => e.asPascalCase).toList()
			);
			setState(() {

			});
		});
	}

	Widget _buildSuggestions() {
		return ListView.separated(
			padding: const EdgeInsets.only(left: 16),
			itemCount: _suggestions.length,
			itemBuilder: (context, i) {
				if (_suggestions[i] == loadingTag) {
					if (_suggestions.length < 100) {
						// 获取数据
						_retrieveData();
						// 显示loading
						return Container(
							alignment: Alignment.center,
							padding: EdgeInsets.all(16.0),
							child: SizedBox(
								width: 24, height: 24,
								child: CircularProgressIndicator(strokeWidth: 2.0)
							),
						);
					} else {
						return Container(
							padding: EdgeInsets.all(16.0),
							alignment: Alignment.center,
							child: Text('没有更多数据了！', style: TextStyle(color: Colors.grey))
						);
					}
				}
				return _buildRow(_suggestions[i], i);
			},
			separatorBuilder: (BuildContext context, int index) {
				return diver1;
			},
		);
	}

	Widget _buildRow(String pair, int i) {
		final alreadySaved = _saved.contains(pair);
		return ListTile (
			title: Text ('$i、$pair', style: _biggerFont),
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