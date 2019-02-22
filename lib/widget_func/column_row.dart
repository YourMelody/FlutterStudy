
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
					// row
					_child1(),

					// column
					_child2(),

					// Column嵌套Column
					_child3()
				]
			),
		);
	}

	_child1() {
		return Expanded(
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


	// ⚠️：如果Row里面嵌套Row，或者Column里面嵌套Column，则只有最外层的Row或Column会占用尽可能大的空间
	// 里面Row或Column所占用的空间为实际大小。如果想让内部Row或Column占满，可以配合Expanded使用
	_child3() {
		return Expanded(
			flex: 2,
			child: Container(
				color: Colors.green,
				padding: EdgeInsets.all(10),
				child: Column(
					mainAxisSize: MainAxisSize.max, // 外层Column，高度尽可能大（这里为屏幕的1/2）
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Container(
							color: Colors.blue,
							child: Column(
								mainAxisSize: MainAxisSize.max, // 内层Column为实际大小（即内层Column所有子widgets的高度总和）
								children: <Widget>[
									Text('Hello'),
									Text(' world!')
								],
							),
						)
					],
				),
			),
		);
	}
}