import 'package:flutter/material.dart';

class DecoratedAndTransform extends StatefulWidget {
	@override
	_DecoratedAndTransformState createState() => _DecoratedAndTransformState();
}

class _DecoratedAndTransformState extends State<DecoratedAndTransform> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('装饰容器和变换')),
			body: Center(
				child: Column(
					children: <Widget>[
						Padding(padding: EdgeInsets.only(bottom: 20)),
						_getDecoratedBox(),

						Padding(padding: EdgeInsets.only(bottom: 80)),
						_getTransform()
					],
				),
			),
		);
	}


	/* *
	 * DecoratedBox可以在其子widget绘制前（或后）绘制一个装饰Decorated（如背景、边框、渐变等）。
	 * 其属性如下：
	 *  1、decoration：将要绘制的装饰，类型为Decoration（一个抽象类）
	 *  2、position：决定在哪里绘制Decoration，接收DecorationPosition的枚举类型，该枚举类两个值：
	 *      background：在子widget之后绘制，即背景装饰
	 *      foreground：在子widget之上绘制，即前景
	 *
	 *
	 * BoxDecoration为Decoration的子类，实现了常用的装饰元素的绘制
	 */
	_getDecoratedBox() {
		return DecoratedBox(
			decoration: BoxDecoration(
				gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]), // 背景色渐变
				borderRadius: BorderRadius.circular(3), // 圆角
				boxShadow: [ // 阴影效果
					BoxShadow(
						color: Colors.black,
						offset: Offset(2, 2),
						blurRadius: 4
					)
				]
			),
			child: Padding(
				padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
				child: Text('Login', style: TextStyle(color: Colors.white))
			),
			position: DecorationPosition.background
		);
	}

	_getTransform() {
		return Container(
			color: Colors.black,
			child: Transform(
				alignment: Alignment.topRight, // 相对于坐标圆点的对齐方式
				transform: Matrix4.skewY(0.5), // 沿Y轴倾斜0.5弧度
				child: Container(
					padding: EdgeInsets.all(10),
					color: Colors.deepOrange,
					child: Text('Flutter真有意思')
				),
			),
		);
	}
}