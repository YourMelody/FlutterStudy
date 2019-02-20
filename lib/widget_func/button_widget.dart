import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyButtonDemo extends StatefulWidget {
	@override
	State<StatefulWidget> createState() => _MyButtonDemoState();
}

class _MyButtonDemoState extends State<MyButtonDemo> {
	@override
	Widget build(BuildContext context) {
        return Scaffold(
	        appBar: AppBar(
		        title: Text('Button'),
	        ),
	        body: Column(
		        children: <Widget>[
		        	Expanded(
				        child: Row(
					        children: <Widget>[
					        	Expanded(child: Column(children: <Widget>[
							        // 不设置边框的button
							        _raisedButtonDemo(false),
							        _flatButtonDemo(false),
							        _outlineButtonDemo(false),
							        _rawMaterialButtonDemo(false),
							        _descText('没有设置边框的btn')
						        ])),
					        	Expanded(child: Column(children: <Widget>[
							        // 设置了边框效果的button
							        _raisedButtonDemo(true),
							        _flatButtonDemo(true),
							        _outlineButtonDemo(true),
							        _rawMaterialButtonDemo(true),
							        _descText('设置了shape属性的btn')
						        ]))
					        ],
				        )
			        ),
					
			        // 分割线
			        _separator(),

			        Expanded(child: Column(children: <Widget>[
				        // 自定义样式的button
				        _myButton1(),
				        _myButton2(),

				        // iOS风格的button
				        _iosButtonDemo()
			        ]))
		        ],
	        ),
	        floatingActionButton: FloatingActionButton(
		        onPressed: _showMyDialog,
		        child: Icon(Icons.brush),
		        tooltip: 'Floating',
	        ),
        );
    }

    // RaisedButton 凸起效果
    _raisedButtonDemo(bool withBorder) {
		return Container(
			alignment: Alignment.center,
			padding: EdgeInsets.only(top: 20),
			child: RaisedButton(
				onPressed: () => _showMyDialog(),
				onHighlightChanged: (value) {
					print('highlight changed: $value');
				},
				textColor: Colors.white,
				color: Colors.blue,
				child: Text('RaisedButton'),
				padding: EdgeInsets.all(10),
				shape: withBorder ? RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(20),
					side: BorderSide(
						color: Colors.black,
						width: 1,
					)
				) : null,
				elevation: 10,
			),
		);
    }

    // FlatButton 扁平化
	_flatButtonDemo(bool withBorder) {
		return Container(
			alignment: Alignment.center,
			padding: EdgeInsets.only(top: 20),
			child: FlatButton(
				onPressed: () => _showMyDialog(),
				onHighlightChanged: (value) {
					print('highlight changed: $value');
				},
				textColor: Colors.white,
				color: Colors.blue,
				child: Text('FlatButton'),
				padding: EdgeInsets.all(10),
				shape: withBorder ? RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(20),
					side: BorderSide(
						style: BorderStyle.solid
					)
				) : null
			),
		);
	}

	// OutlineButton 扁平化，没有背景色，有边框
	_outlineButtonDemo(bool withBorder) {
		return Container(
			alignment: Alignment.center,
			padding: EdgeInsets.only(top: 20),
			child: OutlineButton(
				onPressed: () => _showMyDialog(),
				textColor: Colors.blue,
				child: Text('OutlineButton'),
				padding: EdgeInsets.all(10),
				// 设置边框的颜色和宽度
				borderSide: BorderSide(
					color: Colors.blue
				),
				shape: withBorder ? RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(20),
					side: BorderSide(
						style: BorderStyle.solid
					)
				) : null
			),
		);
	}

	// MaterialButton 扁平化，效果类似FlatButton
	_rawMaterialButtonDemo(bool withBorder) {
		return Container(
			alignment: Alignment.center,
			padding: EdgeInsets.only(top: 20),
			child: withBorder ? RawMaterialButton(
				onPressed: () => _showMyDialog(),
				child: Text('RawMaterialButton'),
				padding: EdgeInsets.all(10),
				fillColor: Colors.blue,
				textStyle: TextStyle(color: Colors.white),
				shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(20),
					side: BorderSide(
						style: BorderStyle.solid
					)
				)
			) : RawMaterialButton(
				onPressed: () => _showMyDialog(),
				child: Text('RawMaterialButton'),
				padding: EdgeInsets.all(10),
				fillColor: Colors.blue,
				textStyle: TextStyle(color: Colors.white)
			)
		);
	}

	// 通过GestureDetector布局自定义样式的button
	_myButton1() {
		return GestureDetector(
			onTap: () => _showMyIOSDialog(),
			child: Container(
				width: 70,
				height: 28,
				margin: EdgeInsets.only(top: 20),
				decoration: BoxDecoration(
					borderRadius: BorderRadius.circular(11.0),
					border: Border.all(width: 0.5, color: Color(0xFF6BCBD7))
				),
				child: Center(
					child: Text('点击刷新',
						style: TextStyle(
							fontSize: 13,
							color: Color(0xFF6BCBD7)
						),
					),
				),
			),
		);
	}

	_myButton2() {
		return Container(
			alignment: Alignment.center,
			width: 70,
			height: 28,
			margin: EdgeInsets.only(top: 20),
			child: OutlineButton(
				onPressed: _showMyIOSDialog,
				child: Text(
					'点击刷新',
					style: TextStyle(
						fontSize: 13,
						color: Color(0xFF6BCBD7),
						fontWeight: FontWeight.w400
					)
				),
				shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(11),
				),
				borderSide: BorderSide(
					color: Color(0xFF6BCBD7),
					width: 0.5
				),
				padding: EdgeInsets.all(0)
			),
		);
	}

	// iOS风格的button
	_iosButtonDemo() {
		return Container(
			margin: EdgeInsets.only(top: 20),
			child: CupertinoButton(
				child: Text(
					'CupertinoButton',
					style: TextStyle(fontSize: 17, color: Colors.white),
				),
				padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
				color: Colors.blue,
				borderRadius: BorderRadius.circular(10),
				minSize: 20,
				onPressed: () => _showMyIOSDialog()
			)
		);
	}

	_showMyDialog() {
		showDialog(
			context: context,
			builder: (context) {
				return AlertDialog(
					title: Text('我是title'),
					content: Text('我是content'),
					actions: <Widget>[
						FlatButton(
							onPressed: () {
								Navigator.pop(context);
							},
							child: Text('取消')
						),
						FlatButton(
							onPressed: () {
								Navigator.pop(context);
							},
							child: Text('确定')
						),
						FlatButton(
							onPressed: () {
								Navigator.pop(context);
							},
							child: Text('确定aa')
						)
					],
				);
			}
		);
	}

	_showMyIOSDialog() {
		showDialog(
			context: context,
			builder: (context) {
				return CupertinoAlertDialog(
					title: Text('我是title'),
					content: Text('我是content'),
					actions: <Widget>[
						CupertinoButton(
							onPressed: () {
								Navigator.pop(context);
							},
							child: Text('取消')
						),
						CupertinoButton(
							onPressed: () {
								Navigator.pop(context);
							},
							child: Text('确定')
						)
					],
				);
			}
		);
	}

	// 分割线
	_separator() {
		return Container(
			height: 10,
			color: Color(0xFFE5E5E5),
			margin: EdgeInsets.only(top: 10),
		);
	}

	// desc
	_descText(String textStr) {
		return Container(
			padding: EdgeInsets.only(top: 20),
			child: Text(
				textStr,
				style: TextStyle(color: Colors.blue, fontSize: 17)
			)
		);
	}
}