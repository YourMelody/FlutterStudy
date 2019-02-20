import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';

class DingDanDemo extends StatelessWidget {
	final List dataSource = [
		{"info": "[北京市]已签收，感谢使用顺丰，期待再次为您服务，感谢使用顺丰速运，期待再次为您服务", "time": "2018/10/22 下午12:22:22"},
		{"info": "[北京市]北京朝阳区来广营营业点派件员：顺丰速运 18888888888 正在为您派件", "time": "2018/10/22 下午12:22:22"},
		{"info": "药师已审核通过", "time": "2018/10/22 下午12:22:22"},
		{"info": "业务已审核通过", "time": null},
		{"info": "订单已打印完毕", "time": ''},
		{"info": "订单已拣货完成"},
		{"info": "商品已打包，即将发货", "time": "2018/10/22 下午12:22:22"},
		{"info": "您的包裹已发出，请等待签收", "time": "2018/10/22 下午12:22:22"},
		{"info": "顺丰速运 已收取快件", "time": "2018/10/22 下午12:22:22"},
		{"info": "快件在【化信大厦吧啦吧啦吧啦吧啦吧啦】已装车，准备发下一站", "time": "2018/10/22 下午12:22:22"}
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('物流信息')
			),
			backgroundColor: Colors.white,
			body: ListView.builder(
				itemBuilder: (context, index) {
					if (index == 0) {
						// 列表头部
						return _ItemHeader();
					} else {
						return _InformationItem(index-1, dataSource[index-1], dataSource.length-1);
					}
				},
				itemCount: this.dataSource.length+1,
				padding: EdgeInsets.only(bottom: 15)
			),
		);
	}
}

// 列表头部
class _ItemHeader extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
			height: 49,
			decoration: BoxDecoration(
				// 设置container的边框
				border: Border(
					bottom: BorderSide(
						color: Color(0xFFE5E5E5)
					)
				)
			),
			child: Row(
				// 沿主轴方向居中
				mainAxisAlignment: MainAxisAlignment.start,
				// 沿竖直方向居中
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					Text(
						"订单编号：",
						style: TextStyle(color: Color(0xFF999999), fontSize: 14),
					),
					Expanded(child: Text(
						'12345678765432112345',
						style: TextStyle(color: Color(0xFF0A1314), fontSize: 14),
						maxLines: 1,
						overflow: TextOverflow.ellipsis,
					))
				]
			),
		);
	}
}

class _InformationItem extends StatelessWidget {
	final int currentIndex;
	final infoDic;
	final int lastIndex;
	_InformationItem(this.currentIndex, this.infoDic, this.lastIndex);

	@override
	Widget build(BuildContext context) {
		String time = infoDic["time"];
		return Padding(
			padding: EdgeInsets.only(left: 22),
			child: IntrinsicHeight(
				child: Row(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: <Widget>[
						Container(
							alignment: Alignment.center,
							width: 15,
							child: Column(
								children: <Widget>[
									Container(
										width: currentIndex == 0 ? 0 : 2,
										height: 19,
										color: Color(0xFFCBCBCB),
									),
									Container(
										width: currentIndex == 0 ? 15 : 7,
										height: currentIndex == 0 ? 15 : 7,
										decoration: BoxDecoration(
											borderRadius: BorderRadius.all(
												Radius.circular(8.0),
											),
											color: Color(0xFFCBCBCB)
										),
									),
									Expanded(
										child: Container(
											color: Color(0xFFCBCBCB),
											width: currentIndex == lastIndex ? 0 : 2,
										),
									)
								],
							),
						),

						Padding(padding: new EdgeInsets.only(right: 20)),

						Expanded(
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
									Padding(padding: EdgeInsets.only(bottom: 15)),
									_getRichTextInfo(),
									Offstage(
										offstage: time.runtimeType != String || time.length == 0,
										child: Text(
											infoDic["time"] ?? '',
											style: TextStyle(fontSize: 14, color: Color(0x660A1314)),
											maxLines: 1
										),
									),
									Padding(padding: new EdgeInsets.only(bottom: 10)),
									Container(
										height: 1,
										color: Color(0xFFE5E5E5)
									)
								],
							),
						),
					],
				),
			),
		);
	}

	final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer()
		..onTap = () {
			print('on tap 188888888888');
		};

	// 快递信息--富文本
	_getRichTextInfo() {
		String textStr = infoDic["info"];
		RegExp exp = new RegExp('1(3|4|5|7|8)\\d{9}');
		List<String> listStr = textStr.split(exp);
		if (listStr.length > 1) {
			int strIndex = textStr.indexOf(exp);
			final numberPhone = textStr.substring(strIndex, strIndex + 11);
			return Container(
				padding: EdgeInsets.only(right: 15),
				child: RichText(
					text: TextSpan(
						text: listStr[0],
						style: TextStyle(fontSize: 14, color: Color(0xCC0A1314)),
						children: <TextSpan>[
							TextSpan(
								text: numberPhone,
								style: TextStyle(fontSize: 14, color: Color(0xFF6BCBD7)),
								recognizer: _tapGestureRecognizer
							),
							TextSpan(
								text: listStr[1],
								style: TextStyle(fontSize: 14, color: Color(0xCC0A1314))
							)
						]
					),
				),
			);
		} else {
			return Container(
				padding: EdgeInsets.only(right: 15),
				child: Text(
					textStr,
					style: TextStyle(fontSize: 14, color: Color(0xCC0A1314)),
					maxLines: 3,
					overflow: TextOverflow.ellipsis
				),
			);
		}
	}
}