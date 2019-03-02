import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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


/* *
 * 加载文本assets
 * 1、直接使用package:flutter/services.dart中全局静态的rootBundle对象来加载asset
 * 2、建议使用 DefaultAssetBundle 来获取当前BuildContext的AssetBundle来加载。这种方式是使用父级Widget
 *  在运行时动态替换的不同的AssetBundle。
 * 通常，可以使用DefaultAssetBundle.of()在应用运行时来间接加载asset（例如JSON文件），而在widget上下文之外，
 * 或其它AssetBundle句柄不可用时，可以使用rootBundle直接加载这些asset
 */

class JiShuQi extends StatefulWidget {
	JiShuQi({Key key, this.title}) : super(key: key);
	final String title;

	@override
	_JiShuQiState createState() => _JiShuQiState();
}

class _JiShuQiState extends State<JiShuQi> {
	int _counter = 0;
	String localStr;

	/* *
	 * 当Widget第一次插入到Widget树时被调用；对于每一个State对象，该方法只会执行一次。通常在该方法中进行
	 * 状态初始化、订阅子树的事件通知等。
	 * ⚠️：不能在该方法中调用 BuildContext.inheritFromWidgetOfExactType （该方法用于在Widget树上获取离当前
	 * widget最近的一个父级InheritFromWidget），因为在初始化完成后，Widget树中 InheritFromWidget 也可能会
	 * 发生变化，所以应该在 build() 或 didChangeDependencies()中调用。
	 */
	@override
	void initState() {
		super.initState();
		localStr = '';
		loadAsset();
		print('initState');
	}


	/* *
	 * 在Widget重新构建时，Flutter framework会调用Widget.canUpdate 来检测Widget是否需要更新。当新旧widget的key和runtimeType同时相等，
	 * 就会用新widget更新Element对象的配置，这时Widget.canUpdate返回true，该方法会被调用；否则会创建新Element对象，Widget.canUpdate返回false。
	 */
	@override
	void didUpdateWidget(JiShuQi oldWidget) {
		super.didUpdateWidget(oldWidget);
		print('didUpdateWidget');
	}


	/* *
	 * 当State对象从树中移除时会调用。如果移除后没有重新插入到输入，则紧接着会调用dispose()方法
	 */
	@override
	void deactivate() {
		super.deactivate();
		print('deactivate');
	}


	/* *
	 * 当State对象从树中被永久移除时调用。
	 */
	@override
	void dispose() {
		super.dispose();
		print('dispose~~~');
	}


	/* *
	 * 在hot reload时会被调用；在release模式下无效
	 */
	@override
	void reassemble() {
		super.reassemble();
		print('reassemble');
	}


	/* *
	 * 当State对象的依赖发生变化时会被调用。
	 */
    @override
	void didChangeDependencies() {
		super.didChangeDependencies();
		print('didChangeDependencies');
	}

	void loadAsset() async {
		// 加载本地文本资源文件
		String str = await rootBundle.loadString('lib/images/local.json');
		setState(() {
			localStr = str;
		});
	}


	/* *
	 * 在initState()、didUpdateWidget()、setState()、didChangeDependencies()之后都会调用；
	 * 在State对象从树中一个位置移除后（调用deactivate）又重新插入到树的其它位置之后也会调用
	 */
	@override
	Widget build(BuildContext context) {
		print('build');
		return Scaffold(
			appBar: AppBar(
				title: Text('计数器示例'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Image.asset(
							'lib/images/my_icon.png',
							width: 100,
							height: 100
						),
						Padding(padding: EdgeInsets.only(top: 20)),
						Text('$localStr'),
						Padding(padding: EdgeInsets.only(top: 20)),
						Text(
							'$_counter',
							style: Theme.of(context).textTheme.display1,
						),
						Padding(padding: EdgeInsets.only(top: 20)),
						FlatButton(
							onPressed: () {
								Navigator.push(context, MaterialPageRoute(
									builder: (_) {
										return Scaffold(
											appBar: AppBar(title: Text('New Route')),
											body: Center(child: Text('This is new route'))
										);
									},
									fullscreenDialog: false
								));
							},
							child: Text('open new route'),
							textColor: Colors.blue,
						)
					],
				),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () => setState(() => ++_counter),
				tooltip: 'Increment',
				child: Icon(Icons.add),
			),
		);
	}
}