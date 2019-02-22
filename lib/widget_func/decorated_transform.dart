import 'package:flutter/material.dart';
import 'dart:math' as math;

class DecoratedAndTransform extends StatelessWidget {
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
						_getTransform(),

						Padding(padding: EdgeInsets.only(bottom: 40)),
						_getTranslate(),

						Padding(padding: EdgeInsets.only(bottom:60)),
						_getRotate(),

						Padding(padding: EdgeInsets.only(bottom:50)),
						_getScale(),

						Padding(padding: EdgeInsets.only(bottom:20)),
						_getRotatedBox()
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
	Widget _getDecoratedBox() {
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

	// 倾斜
	Widget _getTransform() {
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

	// 平移
	Widget _getTranslate() {
		return DecoratedBox(
			decoration: BoxDecoration(color: Colors.red),
			child: Transform.translate(
				offset: Offset(-20.0, -10.0),
				child: Text('Hello, world!')
			)
		);
	}

	// 旋转
	Widget _getRotate() {
		return DecoratedBox(
			decoration: BoxDecoration(color: Colors.red),
			child: Transform.rotate(
				angle: math.pi / 2,
				child: Text('Hello, world!')
			),
		);
	}

	/* *
	 * 注意：Transform的变换是应用在绘制阶段，并不是应用在布局阶段。所以无论对子widget应用何种变化，
	 * 其占有空间大小和在屏幕上位置固定不变。
	 */

	// 缩放
	Widget _getScale() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				DecoratedBox(
					decoration: BoxDecoration(color: Colors.red),
					child: Transform.scale(
						scale: 1.5,
						child: Text('Hello, world!')
					),
				),

				Text('你好啊', style: TextStyle(color: Colors.red, fontSize: 20))
			],
		);
	}

	// RotatedBox功能和Transform.rotate相似，最大的不同是，RotatedBox的变换是在布局阶段，会影响子widget的位置和大小
	Widget _getRotatedBox() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				DecoratedBox(
					decoration: BoxDecoration(color: Colors.red),
					child: RotatedBox(
						quarterTurns: 1, //旋转90度
						child: Text('Hello, world!')
					),
				),

				Text('你好啊', style: TextStyle(color: Colors.red, fontSize: 20))
			],
		);
	}
}