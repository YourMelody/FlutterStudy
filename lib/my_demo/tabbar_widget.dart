import 'package:flutter/material.dart';
import 'package:flutter_app/model/DrugClassModel.dart';
import 'home_demo.dart';
import 'my_basic.dart';
import 'dingdan_list.dart';
import 'package:flutter_app/jk_druglib/drug_lib_widget.dart';

class MyTabBarWidget extends StatefulWidget {
	@override
	_MyTabBarWidgetState createState() => _MyTabBarWidgetState();
}

class _MyTabBarWidgetState extends State<MyTabBarWidget> with SingleTickerProviderStateMixin {
	int _curIndex = 0;

	List _widget = List();
	List<String> _titles;
	TabController _tabController;
	PageController _pageController = PageController(initialPage: 0);

	List<DrugClassModel> dataSource;

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
		{'title': 'Wrap & Flow & Stack & Positioned', 'desc': '流式布局和层叠布局使用'},
		{'title': 'ConstrainedBox & SizedBox', 'desc': ''},
		{'title': 'DecoratedBox & Transform', 'desc': '装饰容器DecoratedBox和变换Transform'},
		{'title': 'Animation', 'desc': '动画基础'}
	];


	@override
	void initState() {
		super.initState();
		_tabController = TabController(length: 2, vsync: this);
		_tabController.addListener(() {
			// ⚠️ 滑动切换调用一次；点击切换会连续调用两次
			print(_tabController.index);
		});

		_titles = ['Dart', 'Widget', '药品库'];
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: BottomNavigationBar(
				items: [
					BottomNavigationBarItem(
						icon: Icon(Icons.home),
						title: Text(_titles[0])
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.book),
						title: Text(_titles[1])
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.directions_bike),
						title: Text(_titles[2])
					),
				],
				currentIndex: _curIndex,
				onTap: (int index) {
					_pageController.jumpToPage(index);
					setState(() {
						_curIndex = index;
					});
				},
				type: BottomNavigationBarType.fixed
			),
			body: PageView(
				children: <Widget>[
					TabBarView(
						controller: _tabController,
						children: <Widget>[
							// dart基础
							MyBasic(dataList: dartList, basic: ShowBasic.ShowDartBasic),
							// demo
							HomeDemoWidget()
						],
					),

					// widget基础
					MyBasic(dataList: widgetList, basic: ShowBasic.ShowWidgetBasic),

					// 药品库
					JKDrugLibWidget()
				],
				controller: _pageController,
				physics: NeverScrollableScrollPhysics()
			),

			appBar: AppBar(
				title: Text(_titles[_curIndex]),
				actions: _curIndex == 2 ? <Widget>[
					IconButton(icon: Icon(Icons.list), onPressed: () {
						Navigator.of(context).push(MaterialPageRoute(builder: (_) {
							return DingDanDemo();
						}));
					})
				] : null,

				bottom: _curIndex == 0 ? TabBar(
					controller: _tabController,
					tabs: <Widget> [
						Tab(text: 'Dart基础'),
						Tab(text: 'Demo')
					],
				) : null,
			)
		);
	}
}