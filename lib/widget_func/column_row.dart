
import 'package:flutter/material.dart';

class ColumnAndRow extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('水平和竖直布局'),
			),
			body: Column(
				children: <Widget>[
					_child1(),
					_child2()
				]
			),
		);
	}

	_child1() {
		return Expanded(
			child: Row(
				children: <Widget>[
					Expanded(
						child: Container(
							child: Text('aaa'),
							color: Colors.grey,
						),
						flex: 1,
					),
					Expanded(
						child: Container(
							child: Text('bbb'),
							color: Colors.blueGrey,
						),
						flex: 2,
					),
					Expanded(
						child: Container(
							child: Text('ccc'),
							color: Colors.red
						)
					)
				],
				crossAxisAlignment: CrossAxisAlignment.end
			)
		);
	}

	_child2() {
		return Expanded(
			child: Column(
				children: <Widget>[
					Expanded(child: Container(
						child: Text('aaa'),
						color: Colors.grey,
					)),
					Expanded(child: Container(
						child: Text('bbb'),
						color: Colors.blueGrey,
					)),
					Expanded(child: Container(
						child: Text('ccc'),
						color: Colors.red
					))
				],
			)
		);
	}
}