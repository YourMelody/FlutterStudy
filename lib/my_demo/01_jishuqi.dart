import 'package:flutter/material.dart';

/*
* MaterialPageRoute继承自PageRoute类，PageRoute类是个抽象类，表示占有整个屏幕空间的一个模态路由页面，
* 它还定义了路由构建及切换时过渡动画的相关接口及属性。
* MaterialPageRoute是Material组件库的一个Widget，可以针对不同平台，实现与平台切换动画风格一致的路由切换动画：
* 对于Android：打开新页面时，新页面从屏幕底部滑动到屏幕顶部；
* 对于iOS：打开页面时，新页面从屏幕右侧边缘一直滑动到屏幕左边；并且支持侧滑返回
*
*
*
* 关于MaterialPageRoute构造函数的各个参数的意义：
* 1、WidgetBuilder builder：构建路由页面的具体内容，返回值是一个widget
* 2、settings：包含路由的配置信息，如路由名称、是否初始路由（首页）
* 3、maintainState：默认情况下，入栈一个新路由，原来的路由仍然会被保存在内存中；如果想在路由没用的时候释放所占有的所有资源，
*   可以设置maintainState为false
* 4、fullscreenDialog：表示新的路由页面是否具有全屏的模态对话框。在iOS中，如果fullscreenDialog设置为true，
*   新页面将从屏幕底部滑入，且左上角返回按钮变为'X'而不是'<'
* */


/*
* Navigator常用的两个方法：
* 1、Future push(BuildContext context, Route route):
*   将给定的路由入栈，返回值是一个Future对象，用以接收新路由出栈（及关闭）时的返回数据
* 2、bool pop(BuildContext context, [result]):
*   将栈顶路由出栈，result为返回给上个页面的数据
* */

class JiShuQi extends StatefulWidget {
	JiShuQi({Key key, this.title}) : super(key: key);
	final String title;

	@override
	_JiShuQiState createState() => _JiShuQiState();
}

class _JiShuQiState extends State<JiShuQi> {
	int _counter = 0;

	void _incrementCounter() {
		setState(() {
			_counter++;
		});
	}

	@override
	void dispose() {
		super.dispose();
		print('dispose~~~');
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('计数器示例'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text('You have pushed the button this many times'),
						Text(
							'$_counter',
							style: Theme.of(context).textTheme.display1,
						),
						FlatButton(
							onPressed: () {
								Navigator.push(context, MaterialPageRoute(
									builder: (_) {
										return Scaffold(
											appBar: AppBar(title: Text('New Route')),
											body: Center(child: Text('This is new route'))
										);
									},
									fullscreenDialog: false,
									maintainState: false
								));
							},
							child: Text('open new route'),
							textColor: Colors.blue,
						)
					],
				),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: _incrementCounter,
				tooltip: 'Increment',
				child: Icon(Icons.add),
			),
		);
	}
}