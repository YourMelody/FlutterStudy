import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Container使用'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						_getMyText(),

						_getMyPadding(),
						_getMyDefText(),

						_getMyPadding(),
						_getMyRichText(),

						_getMyPadding(),
						_getMyContainer(),
					],
				),
			),
		);
    }



    Widget _getMyText() {
		return Text(
			'balalalayyy' * 5,
			textAlign: TextAlign.center,
			style: TextStyle(
				fontSize: 14,
				color: Colors.white,
				fontWeight: FontWeight.w500,
				fontFamily: 'Courier',
				background: Paint()..color=Colors.grey,
				decoration: TextDecoration.underline,
				decorationStyle: TextDecorationStyle.dashed
			),
			// 最大行数
			maxLines: 1,
			// 文本展示不全的显示方式：fade（从下向上渐变色，能展示全则没有渐变效果）、clip（直接截断）、ellipsis（显示...）
			overflow: TextOverflow.ellipsis,
			// 文本字体大小的缩放因子（1.5倍的当前字体大小）该属性主要用于系统字体大小设置改变时，对Flutter应用字体进行全局调整
			textScaleFactor: 1.5,
		);
    }



    Widget _getMyDefText() {
		// 文本的默认样式是可以被继承的。其子节点的子树中都会默认使用这个样式。
		return DefaultTextStyle(
			style: TextStyle(
				color: Color(0xFF13579a),
				fontSize: 30
			),
			textAlign: TextAlign.start,
			child: Column(
				children: <Widget>[
					Text('hello world!'),
					Text("I'm ok"),
					Text(
						'balabala',
						style: TextStyle(
							// 不继承默认样式
							inherit: false,
							color: Colors.grey,
							fontSize: 20
						),
					)
				],
			),
		);
    }



    Widget _getMyRichText() {
		return Text.rich(TextSpan(
			children: [
				TextSpan(
					text: '第一部分',
					style: TextStyle(
						color: Colors.blue,
						fontSize: 16.0
					)
				),
				TextSpan(
					text: '二222二',
					style: TextStyle(
						color: Colors.red,
						fontSize: 20.0
					)
				),
				TextSpan(
					text: 'last~~~',
					style: TextStyle(
						color: Colors.black,
						fontSize: 17.0
					)
				)
			]
		));
    }



    Widget _getMyContainer() {
		return Container(
			alignment: Alignment.center,
			child: _getMyText(),
			height: 49,
			margin: EdgeInsets.all(20),
			padding: EdgeInsets.only(top: 10),
//		        color: Colors.blueGrey,
			// 使用它就不能设置Container的color
			decoration: BoxDecoration(
				// 圆角
				borderRadius: BorderRadius.only(
					topLeft: Radius.circular(10),
					bottomRight: Radius.circular(10)
				),
				// 背景色
				color: Colors.blue,
				// 边框
				border: Border.all(
					color: Color(0xFF000000),
					width: 1
				)
			),
		);
    }

    Widget _getMyPadding() {
		return Padding(padding: EdgeInsets.only(top: 20));
    }
}