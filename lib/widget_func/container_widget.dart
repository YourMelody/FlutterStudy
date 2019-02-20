import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Container使用'),
			),
			body: Container(
				alignment: Alignment.center,
				child: Text(
					'balabalabalabalabalabalabalabalabalabalabalabala',
					textAlign: TextAlign.start,
					style: TextStyle(
						fontSize: 20,
						color: Colors.white,
						fontWeight: FontWeight.w500
					),
					maxLines: 1,
					overflow: TextOverflow.fade,
				),
				height: 49,
				margin: EdgeInsets.all(20),
				padding: EdgeInsets.only(top: 0),
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
			),
		);
    }
}