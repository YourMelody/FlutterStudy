import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JKDrugLibWidget extends StatefulWidget {
	@override
	_JKDrugLibWidgetState createState() => _JKDrugLibWidgetState();
}

class _JKDrugLibWidgetState extends State<JKDrugLibWidget> {
	Map dataSource;
	int _curIndex = 0;

	@override
	void initState() {
		super.initState();
		_loadAsset();
	}

	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				_searchView(),

				Expanded(
					child: Container(
						child: Row(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								Container(
									width: 120,
									child: _leftList(),
								),

								Expanded(child: Container(
									color: Color(0xfff4f6f9),
									padding: EdgeInsets.only(left: 8),
									child: _rightList(),
								))
							],
						),
					)
				)
			],
		);
	}

	void _loadAsset() async {
		// 加载本地文本资源文件
		String str = await rootBundle.loadString('lib/images/result.json');
		setState(() {
			dataSource = json.decode(str);
		});
	}

	// 搜索框
	_searchView() {
		return GestureDetector(
			child: Container(
				margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
				height: 30,
				decoration: BoxDecoration(
					borderRadius: BorderRadius.all(Radius.circular(18.0)),
					color: Color(0xfff5f5f5)
				),
				child: Row(
					mainAxisAlignment: MainAxisAlignment.start,
					children: <Widget>[
						Padding(padding: EdgeInsets.only(left: 10)),
						Icon(
							Icons.search,
							color: Colors.grey,
							size: 18,
						),
						Padding(padding: EdgeInsets.only(left: 5)),
						Text(
							'搜索药品',
							style: TextStyle(color: Colors.grey, fontSize: 14),
						)
					],
				),
			),
			onTap: () {
				print('tap search view');
			}
		);
	}

	_leftList() {
		if (dataSource == null) return null;
		List data = dataSource['data'];
		return ListView.separated(
			itemBuilder: (context, index) {
				return _getLeftItem(data[index]['categoryName'], index);
			},
			itemCount: data.length,
			separatorBuilder: (BuildContext context, int index) {
				return Divider(color: Color(0xffe5e5e5), height: 0.5);
			}
		);
	}

	_getLeftItem(String itemName, int index) {
		return GestureDetector(
			onTap: () {
				setState(() {
					_curIndex = index;
				});
			},
			child: Container(
				padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
				color: index == _curIndex ? Color(0xfff4f6f9) : Colors.white,
				child: Text(
					itemName,
					style: TextStyle(
						color: index == _curIndex ? Color(0xff6bcbd6) : Color(0xff0a1314),
						fontSize: 14
					),
					textAlign: TextAlign.center,
					maxLines: 2,
				)
			),
		);
	}

	_rightList() {
		if (dataSource == null) return null;
		List data = dataSource['data'][_curIndex]['categories'];
		return ListView.separated(
			itemBuilder: (context, index) {
				return _getRightItem(data[index]['categoryName'], data[index]['categories']);
			},
			itemCount: data.length,
			separatorBuilder: (BuildContext context, int index) {
				List cateList = data[index]['categories'];
				if (cateList.length == 0) {
					return Divider(color: Color(0xffe5e5e5), height: 0.5);
				}
				return Padding(padding: EdgeInsets.only());
			}
		);
	}

	_getRightItem(String itemName, List categories) {
		return Column(
			children: <Widget>[
				Container(
					padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
					child: Row(
						children: <Widget>[
							Expanded(child: Text(
								itemName,
								style: TextStyle(fontSize: 14, color: Colors.black54)
							)),
							Icon(Icons.navigate_next, size: 18)
						],
					),
				),

				categories.length == 0 ? Padding(padding: EdgeInsets.only()) :
					Container(
						margin: EdgeInsets.only(right: 10),
						padding: EdgeInsets.all(15),
						decoration: BoxDecoration(
							color: Colors.white,
							borderRadius: BorderRadius.all(Radius.circular(5))
						),
						child: Wrap(
							runSpacing: 15,
							spacing: 10,
							children: categories.map((e) {
								return Container(
									color: Color(0xfff4f6f9),
									height: 70,
									padding: EdgeInsets.symmetric(horizontal: 5),
									width: (MediaQuery.of(context).size.width - 178) * 0.5,
									alignment: Alignment.center,
									child: Text(
										e['categoryName'],
										textAlign: TextAlign.center
									),
								);
							}).toList(),
						),
					)
			],
		);
	}
}