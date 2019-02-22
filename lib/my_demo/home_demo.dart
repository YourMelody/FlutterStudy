import 'package:flutter/material.dart';
import 'unlimated_list.dart';

class HomeDemoWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			itemBuilder: (context, index) {
				return _DemoItem(curIndex: index);
			},
			itemCount: 20,
		);
	}
}

class _DemoItem extends StatelessWidget {
	_DemoItem({Key key, this.curIndex}) : super(key: key);
	final int curIndex;
	@override
	Widget build(BuildContext context) {
		return Container(
			// Card：默认margin为4，自带边框圆角、背景色
			child: Card(
				child: FlatButton(
					onPressed: () {
						_itemPress(context, curIndex);
					},
					child: Padding(
						padding: EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),

						child: Column(
							mainAxisSize: MainAxisSize.min,
							children: <Widget>[

								Container(
									child: Text(
										"pushListDemo--${this.curIndex + 1}",
										style: TextStyle(
											color: Colors.grey,
											fontSize: 14
										),
										maxLines: 3,
										overflow: TextOverflow.ellipsis
									),
									margin: EdgeInsets.only(top: 6, bottom: 2),
									alignment: Alignment.topLeft
								),

								Padding(padding: EdgeInsets.all(10)),

								Row(
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

	 void _itemPress(context, index) {
		switch (index) {
			case 0:
				Navigator.of(context).pushNamed('/jishuqi_demo');
				break;
			case 1:
				Navigator.of(context).pushNamed('/manage_state');
				break;
			case 2:
				Navigator.of(context).push(MaterialPageRoute(builder: (_) {
					return RandomWords(title: '无限列表');
				}));
				break;

		}
	}

	// 返回一个居中带图标和文本的Item
	Widget _getBottomItem(IconData icon, String text) {
		// 充满Row横向的布局
		return Expanded(
			child: Row(
				// 沿主轴方向居中
				mainAxisAlignment: MainAxisAlignment.center,
				// 沿竖直方向居中
				crossAxisAlignment: CrossAxisAlignment.center,
				// 大小按照最大充满
				mainAxisSize: MainAxisSize.max,
				children: <Widget>[
					// 图标
					Icon(
						icon,
						size: 16,
						color: Colors.grey,
					),
					// 间隔
					Padding(padding: EdgeInsets.only(right: 5)),
					// 文本
					Text(
						text,
						style: TextStyle(color: Colors.grey, fontSize: 14),
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