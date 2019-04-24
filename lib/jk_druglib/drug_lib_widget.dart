import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/utiles/BaseRequest.dart';
import 'package:flutter_app/model/DrugClassModel.dart';
import 'drug_list_widget.dart';

class JKDrugLibWidget extends StatefulWidget {
	@override
	_JKDrugLibWidgetState createState() => _JKDrugLibWidgetState();
}

class _JKDrugLibWidgetState extends State<JKDrugLibWidget> with AutomaticKeepAliveClientMixin {
	List<DrugClassModel> dataSource;
	int _curIndex = 0;

	@override
	void initState() {
		super.initState();
		_initData();
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

	// 请求数据
	void _initData() {
		BaseRequest.getDrugClassList('2').then((response) {
			setState(() {
				dataSource = response;
			});
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
		return ListView.separated(
			itemBuilder: (context, index) {
				return _getLeftItem(dataSource[index], index);
			},
			itemCount: dataSource.length,
			separatorBuilder: (BuildContext context, int index) {
				return Divider(color: Color(0xffe5e5e5), height: 0.5);
			}
		);
	}

	_getLeftItem(DrugClassModel model, int index) {
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
					model.categoryName,
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
		List<DrugClassModel> data = dataSource[_curIndex].categories;
		return ListView.separated(
			itemBuilder: (context, index) {
				if (_curIndex == 0 && index == 0) {
					return _getRightFirstItem('名医推荐');
				}
				return _getRightItem(data[index]);
			},
			itemCount: _curIndex == 0 ? 1 : data.length,
			separatorBuilder: (BuildContext context, int index) {
				List cateList = data[index].categories;
				if (cateList.length == 0) {
					return Divider(color: Color(0xffe5e5e5), height: 0.5);
				}
				return Padding(padding: EdgeInsets.only());
			}
		);
	}

	_getRightFirstItem(String itemName) {
		return GestureDetector(
			child: UnconstrainedBox(
				alignment: Alignment.centerLeft,
				child: Container(
					padding: EdgeInsets.only(left: 5),
					width: 120,
					child: Column(
						children: <Widget>[
							Padding(padding: EdgeInsets.only(top: 20)),
							Image.asset(
								'lib/images/pharmacy_mytj.png',
								width: 110
							),
							Padding(padding: EdgeInsets.only(top: 10)),
							Text(
								itemName,
								textAlign: TextAlign.center,
								style: TextStyle(fontSize: 14, color: Colors.black54)
							)
						],
					)
				)
			),

			onTap: () => _gotoProductList(null),
		);
	}

	_getRightItem(DrugClassModel model) {
		return Column(
			children: <Widget>[
				GestureDetector(
					child: Container(
						padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
						child: Row(
							children: <Widget>[
								Expanded(child: Text(
									model.categoryName,
									style: TextStyle(fontSize: 14, color: Colors.black54)
								)),
								Icon(Icons.navigate_next, size: 18)
							],
						),
					),
					
					onTap: () => _gotoProductList(model),
				),

				model.categories.length == 0 ? Padding(padding: EdgeInsets.only()) :
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
							children: model.categories.map((e) {
								return GestureDetector(
									child: Container(
										color: Color(0xfff4f6f9),
										height: 70,
										padding: EdgeInsets.symmetric(horizontal: 5),
										width: (MediaQuery.of(context).size.width - 178) * 0.5,
										alignment: Alignment.center,
										child: Text(
											e.categoryName,
											textAlign: TextAlign.center
										),
									),

									onTap: () => _gotoProductList(e),
								);
							}).toList(),
						),
					)
			],
		);
	}

	_gotoProductList(DrugClassModel model) {
		Navigator.of(context).push(MaterialPageRoute(builder: (_) => DrugListWidget(model)));
	}

	@override
	bool get wantKeepAlive => true;
}