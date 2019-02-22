import 'package:flutter/material.dart';
import 'home_demo.dart';
import 'my_basic.dart';

class MyTabBarWidget extends StatefulWidget {
	@override
	_MyTabBarWidgetState createState() => _MyTabBarWidgetState();
}

class _MyTabBarWidgetState extends State<MyTabBarWidget> {
	int _curIndex = 0;

	List<Widget> _widget = List();

	final List<Map> dartList = [
		{'title': '常量和变量', 'desc': '常量/变量的基本用法'},
		{'title': '数据类型', 'desc': 'num/str/bool/list/map的基本使用'},
		{'title': '异常', 'desc': 'throw/try/on catch/catch'},
		{'title': '函数', 'desc': '函数的可选位置/命名参数'},
		{'title': '构造函数', 'desc': '类的构造函数'},
		{'title': '异步', 'desc': 'event/queue/future/async/await'}
	];

	final List<Map> widgetList = [
		{'title': 'StateWidget', 'desc': 'StatelessWidget & StatefulWidget'},
		{'title': 'Container & Text & TextSpan', 'desc': ''},
		{'title': 'Image & TextField', 'desc': '图片和输入框的基本使用'},
		{'title': 'Column & Row & Expended', 'desc': '水平布局和竖直布局使用'},
		{'title': 'Button', 'desc': 'RaisedButton & FlatButton & OutlineButton等等'},
		{'title': 'Switch & Checkbox & Form', 'desc': '单选开关、复选框及表单的使用'},
		{'title': 'Wrap & Flow & Stack & Positioned', 'desc': '流式布局和层叠布局使用'}
	];
	@override
	void initState() {
		super.initState();
		_widget
			..add(MyBasic(dataList: dartList, basic: ShowBasic.ShowDartBasic))
			..add(MyBasic(dataList: widgetList, basic: ShowBasic.ShowWidgetBasic))
			..add(HomeDemoWidget());
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: BottomNavigationBar(
				items: [
					BottomNavigationBarItem(
						icon: Icon(
							Icons.home
						),
						title: Text('Dart')
					),
					BottomNavigationBarItem(
						icon: Icon(
							Icons.book
						),
						title: Text('Widget')
					),
					BottomNavigationBarItem(
						icon: Icon(
							Icons.directions_bike
						),
						title: Text('Demo')
					)
				],
				currentIndex: _curIndex,
				onTap: (int index) {
					setState(() {
						_curIndex = index;
					});
				},
				type: BottomNavigationBarType.fixed
			),
			body: _widget[_curIndex]
		);
	}
}