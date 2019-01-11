import 'package:flutter/material.dart';
import 'unlimated_list.dart';
import 'dingdan_list.dart';

class HomeDemoWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			backgroundColor: Colors.blue,
			appBar: new AppBar(
				title: new Text("Demo"),
				actions: <Widget>[
					IconButton(icon: Icon(Icons.list), onPressed: () {
						Navigator.of(context).push(MaterialPageRoute(builder: (_) {
							print('fadfdsafdsdsf');
							return DingDanDemo();
						}));
					}),
				],
			),
			body: new ListView.builder(
				itemBuilder: (context, index) {
					return new DemoItem(curIndex: index);
				},
				itemCount: 20,
			),
		);
	}
}

class DemoItem extends StatelessWidget {
	DemoItem({Key key, this.curIndex}) : super(key: key);
	final int curIndex;
	@override
	Widget build(BuildContext context) {
		return new Container(
			// Card：默认margin为4，自带边框圆角、背景色
			child: new Card(
				child: new FlatButton(
					onPressed: () {
						Navigator.of(context).push(MaterialPageRoute(builder: (_) {
							return FirstDemo(titleStr: '无限列表');
						}));
					},
					child: new Padding(
						padding: new EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),

						child: new Column(
							mainAxisSize: MainAxisSize.min,
							children: <Widget>[

								new Container(
									child: new Text(
										"pushListDemo--${this.curIndex + 1}",
										style: TextStyle(
											color: Colors.grey,
											fontSize: 14
										),
										maxLines: 3,
										overflow: TextOverflow.ellipsis
									),
									margin: new EdgeInsets.only(top: 6, bottom: 2),
									alignment: Alignment.topLeft
								),

								new Padding(padding: EdgeInsets.all(10)),

								new Row(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										_getBottomItem(Icons.star, "9999+"),
										_getBottomItem(Icons.link, "999+"),
										_getBottomItem(Icons.subject, "99+")
									],
								),
							],
						),
					)
				),
			),
		);
	}

	// 返回一个居中带图标和文本的Item
	_getBottomItem(IconData icon, String text) {
		// 充满Row横向的布局
		return new Expanded(
			child: new Row(
				// 沿主轴方向居中
				mainAxisAlignment: MainAxisAlignment.center,
				// 沿竖直方向居中
				crossAxisAlignment: CrossAxisAlignment.center,
				// 大小按照最大充满
				mainAxisSize: MainAxisSize.max,
				children: <Widget>[
					// 图标
					new Icon(
						icon,
						size: 16,
						color: Colors.grey,
					),
					// 间隔
					new Padding(padding: new EdgeInsets.only(right: 5)),
					// 文本
					new Text(
						text,
						style: new TextStyle(color: Colors.grey, fontSize: 14),
						// 超过的省略...显示
						overflow: TextOverflow.ellipsis,
						// 最大行数
						maxLines: 1
					),
				],
			),
		);
	}
}