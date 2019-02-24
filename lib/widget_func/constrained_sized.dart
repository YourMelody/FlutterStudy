import 'package:flutter/material.dart';

/* *
 * ConstrainedBox用于对齐子widget添加额外的约束。如：想让widget最小高度为80，
 * 可以使用const BoxConstraints(minHeight: 80.0)作为子widget的约束。
 * SizedBox则是对ConstrainedBox的一个定制，用于给子widget指定固定的宽高。
 */

class MyConstrainedAndSized extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('布局限制类容器')),
			body: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					// ConstrainedBox
					_getMyConstrainedBox(),
					_separator(),

					// SizedBox
					_getMySizedBox(),
					_separator(),

					// ConstrainedBox嵌套使用约束问题
					_multiMaxConstrainedBox(),
					_separator(),

					_multiMinConstrainedBox(),
					_separator(),

					_getUnconstrainedBox()
				],
			)
		);
	}

	Widget _getMyConstrainedBox() {
		return ConstrainedBox(
			constraints: BoxConstraints(
				minWidth: double.infinity, // 宽度尽可能大
				minHeight: 50 //高度最小为50
			),
			child: _redBox(5),
		);
	}

	Widget _getMySizedBox() {
		return SizedBox(
			width: 80,
			height: 80,
			child: _redBox(5),
		);
	}

	// 对于maxWidth和maxHeight，多重限制时取父子中相应数值较小的
	Widget _multiMaxConstrainedBox() {
		return ConstrainedBox(
			constraints: BoxConstraints(
				maxWidth: 60,
				maxHeight: 60
			),
			child: ConstrainedBox(
				constraints: BoxConstraints(
					maxWidth: 90,
					maxHeight: 30
				),
				child: _redBox(100),
			),
		);
	}

	// 对于minWidth和minHeight，多重限制时去父子中相应数值较大的
	Widget _multiMinConstrainedBox() {
		return ConstrainedBox(
			constraints: BoxConstraints(
				minWidth: 60,
				minHeight: 60
			),
			child: ConstrainedBox(
				constraints: BoxConstraints(
					minWidth: 90,
					minHeight: 30
				),
				child: _redBox(5),
			),
		);
	}
	
	// UnconstrainedBox不会对子widget产生限制，允许子widget按照其本身大小绘制，多用于去除多重限制
	Widget _getUnconstrainedBox() {
		return ConstrainedBox(
			constraints: BoxConstraints(
				minWidth: 200,
				minHeight: 200
			),
			child: UnconstrainedBox(
				child: ConstrainedBox(
					constraints: BoxConstraints(
						minWidth: 70,
						minHeight: 70
					),
					child: _redBox(5),
				),
			),
		);
	}

	Widget _redBox(double h) {
		return Container(
			height: h,
			width: h,
			child: Center(
				child: Text('balabala'),
			),
			color: Colors.red
		);
	}

	Widget _separator() {
		return Container(
			margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
			height: 10,
			color: Colors.grey,
		);
	}
}