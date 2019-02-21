
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
			flex: 1,
			child: Row(
				// 子Widget的布局顺序（ltr: 从左至右）
				textDirection: TextDirection.ltr,

				// 表示Row在主轴（水平）方向占用的空间，
				// 默认是max，表示尽可能多的占用水平空间，此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度
				// min，表示尽可能少的占用水平空间，当子widgets没有占满水平剩余空间，则Row的实际宽度等于所有子widgets占用的水平空间
				mainAxisSize: MainAxisSize.max,

				// 主轴方向对齐方式，如果mainAxisSize设置为min，则此属性无意义；此属性受textDirection影响
				// 如textDirection为ltr（左到右），mainAxisAlignment为start，则左为start；若为rtl，则右为start
				mainAxisAlignment: MainAxisAlignment.center,

				// Row纵轴方向对齐方向，默认是down，即从上到下
				verticalDirection: VerticalDirection.down,

				// 子Widgets纵轴方向对齐方式；此属性受verticalDirection影响（类比mainAxisAlignment）
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					Container(
						child: Text('AAAAA'),
						color: Colors.grey,
					),
					Container(
						child: Text('BBBBB'*2),
						color: Colors.blueGrey,
					),
					Container(
						child: Text('CCCCC'),
						color: Colors.red
					)
				]
			)
		);
	}

	_child2() {
		return Expanded(
			flex: 2,
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