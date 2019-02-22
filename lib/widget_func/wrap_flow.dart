import 'package:flutter/material.dart';

/* *
 * 在Row和Column中，如果子widget超出屏幕范围，则会报溢出错误，因为Row（或Column）默认只有一行，
 * 如果超出屏幕不会折行。
 * 我们把超出屏幕显示范围会自动折行的布局称为流式布局。Wrap和Flow都支持流式布局。
 */

class MyWrapAndFlow extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('流式布局和层叠布局')
			),
			body: Column(
				children: <Widget>[
					Text('1、Wrap'),
					_getMyWrap(),
					_separator(),

					Text('2、Flow'),
					_getMyFlow(),
					_separator(),
					
					Text('3、层叠布局'),
					_getMyStack(),
					_separator(),
				],
			)
		);
	}

	/* *
	* Wrap 的很多属性在Row中都有，如direction、crossAxisAlignment、textDirection等，且意义相同。
	* Wrap中有几个特有的属性：
	*  1、spacing：主轴方向子widget的间距
	*  2、runSpacing：纵轴方向子widget的间距
	*  3、runAlignment：纵轴方向对齐方式
	*/
	_getMyWrap() {
		return Wrap(
			spacing: 10,
			runSpacing: 8,
			alignment: WrapAlignment.center, //主轴方向居中
			children: <Widget>[
				Chip(
					label: Text('Hamilton'),
					avatar: CircleAvatar(
						backgroundColor: Colors.blue,
						child: Text('A'),
					),
				),
				Chip(
					label: Text('Lafayette'),
					avatar: CircleAvatar(
						backgroundColor: Colors.blue,
						child: Text('B'),
					),
				),
				Chip(
					label: Text('Mulligan'),
					avatar: CircleAvatar(
						backgroundColor: Colors.blue,
						child: Text('C'),
					),
				),
				Chip(
					label: Text('Laurens'),
					avatar: CircleAvatar(
						backgroundColor: Colors.blue,
						child: Text('D'),
					),
				)
			],
		);
	}


	/* *
	 * Flow一般很少使用，因为过于复杂，需要自己实现子widget的位置转换。其主要用于一些需要自定义布局策略或性能要求较高的场景。
	 * Flow有如下有点：
	 *  1、性能好：Flow是一个对child尺寸以及位置调整非常高效的控件，它用转换矩阵在对child进行位置调整的时候进行了优化。
	 *      在Flow定位后，如果child位置或尺寸改变了，在FlowDelegate中的paintChildren()中调用context.paintChild进行重绘
	 *  2、灵活：在paintChildren()中调用context.paintChild进行重绘时，需要自己计算每一个widget的位置，所以可以自定义布局策略
	 *
	 * 缺点：
	 *  1、使用复杂
	 *  2、不能自适应widget的大小，必须通过指定父容器大小或实现TestFlowDelegate的getSize返回固定大小
	 */
	_getMyFlow() {
		return Flow(
			delegate: _TestFlowDelegate(margin: EdgeInsets.all(10)),
			children: <Widget>[
				_myContainer(Colors.red),
				_myContainer(Colors.grey),
				_myContainer(Colors.blue),
				_myContainer(Colors.green),
				_myContainer(Colors.brown),
				_myContainer(Colors.purple)
			],
		);
	}

	_myContainer(Color color) {
		return Container(width: 80, height: 80, color: color);
	}

	/* *
	 * 层叠布局（类似Web中的绝对定位），子widget可以根据到父容器四个角的位置来确定本身的位置，允许子widget堆叠。
	 * Flutter中使用Stack和Positioned实现绝对定位。
	 * Stack允许子widget堆叠；
	 * Positioned可以给子widget定位（根据Stack的四个角）
	 */
	_getMyStack() {
		return Expanded(
			child: Container(
				color: Colors.blue,
				child: Stack(
					alignment: Alignment.center, // 未定位或部分定位的widget对齐方式
					fit: StackFit.expand, // 未定位widget占满整个Stack空间（这里即Container铺满）
					children: <Widget>[
						Container(
							child: Text('Hello, world!'),
							color: Colors.red
						),

						Positioned(
							right: 30,
							child: Text('How are you?')
						),

						Positioned(
							bottom: 20,
							child: Text('How old are you?')
						)
					],
				),
			),
		);
	}

	_separator() {
		return Container(
			height: 10,
			margin: EdgeInsets.only(left: 0, right: 0),
			color: Colors.grey
		);
	}
}

class _TestFlowDelegate extends FlowDelegate {
	EdgeInsets margin = EdgeInsets.zero;
	_TestFlowDelegate({this.margin});

	@override
	void paintChildren(FlowPaintingContext context) {
		var x = margin.left;
		var y = margin.top;
		// 计算每一个widget的位置
		for(int i = 0; i < context.childCount; i++) {
			var w = context.getChildSize(i).width + x;
			var h = context.getChildSize(i).height + y;
			if (w < context.size.width) {
				context.paintChild(i,
					transform: Matrix4.translationValues(x, y, 0)
				);
				x = w + margin.left;
			} else {
				x = margin.left;
				y += context.getChildSize(i).height + margin.top;
				// 绘制子widget
				context.paintChild(i,
					transform: Matrix4.translationValues(x, y, 0)
				);
				x += context.getChildSize(i).width + margin.left;
			}
		}
	}


	
	@override
	Size getSize(BoxConstraints constraints) {
		// 指定Flow的大小
		return Size(double.infinity, 200);
	}
	
	@override
	bool shouldRepaint(FlowDelegate oldDelegate) {
		return oldDelegate != this;
	}
}