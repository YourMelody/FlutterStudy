import 'package:flutter/material.dart';
import 'package:flutter_app/basic_func/func01.dart';
import 'package:flutter_app/basic_func/func02.dart';
import 'package:flutter_app/basic_func/func03.dart';
import 'package:flutter_app/basic_func/func04.dart';
import 'package:flutter_app/basic_func/func05.dart';
import 'package:flutter_app/basic_func/func06.dart';

enum ShowBasic {
	ShowDartBasic,
	ShowWidgetBasic
}

class MyBasic extends StatelessWidget {
	final List<Map> dataList;
	final ShowBasic basic;
	MyBasic({Key key, this.dataList, this.basic}) : super(key: key);
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: (basic == ShowBasic.ShowDartBasic) ? Text('Dart') : Text('Widget')
			),
			body: ListView.builder(
				itemBuilder: (context, index) => _ListItem(dataList[index], index, basic),
				itemCount: dataList.length
			),
		);
    }
}

class _ListItem extends StatelessWidget {
	_ListItem(this.textMap, this.curIndex, this.basic);
	final Map textMap;
	final int curIndex;
	final ShowBasic basic;
	@override
	Widget build(BuildContext context) {
        return Card(
	        child: ListTile (
		        title: new Text (
			        textMap['title'],
			        style: TextStyle(fontSize: 20),
		        ),

		        trailing: new Icon(
			        Icons.arrow_forward_ios,
			        color: Colors.blue,
		        ),

		        subtitle: Text(textMap['desc']),

		        onTap: () {
			        if (basic == ShowBasic.ShowDartBasic) {
			        	_onDartItemTap();
			        } else if (basic == ShowBasic.ShowWidgetBasic) {
			        	_onWidgetItemTap(context);
			        }
		        },
	        ),
        );
    }

    _onDartItemTap() {
	    switch (curIndex) {
		    case 0:
		        // 常量和变量的基本使用
			    func01();
			    break;
		    case 1:
		        // 数据类型相关
			    func02();
			    break;
		    case 2:
		        // 异常
			    func03();
			    break;
		    case 3:
		        // 函数参数
			    func04();
			    break;
		    case 4:
		        // 构造函数
			    func05();
			    break;
		    case 5:
		        // 异步
			    func06();
			    break;
	    }
    }

    _onWidgetItemTap(BuildContext context) {
	    switch (curIndex) {
		    case 0:
		    	// 无状态widget
			    Navigator.of(context).pushNamed('/state_widget');
			    break;
		    case 1:
		    	// Container基本使用
		        Navigator.of(context).pushNamed('/container_widget');
			    break;
		    case 2:
		    	// Image
			    Navigator.of(context).pushNamed('/image_textfield');
		    	break;
		    case 3:
		    	// Column/Row/Expended
			    Navigator.of(context).pushNamed('/column_row');
		    	break;
		    case 4:
		    	// Button
			    Navigator.of(context).pushNamed('/button_widget');
			    break;
		    case 5:
		        // Switch/Checkbox
			    Navigator.of(context).pushNamed('/switch_checkbox');
			    break;
	    }
    }
}

