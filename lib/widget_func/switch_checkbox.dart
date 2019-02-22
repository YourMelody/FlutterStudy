import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MySwitchAndCheckbox extends StatefulWidget {
	@override
	_MySwitchAndCheckboxState createState() => _MySwitchAndCheckboxState();
}

class _MySwitchAndCheckboxState extends State<MySwitchAndCheckbox> {
	bool _switchSelected = true;
	bool _cupertinoSelected = true;
	bool _checkboxSelected = true;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('SwitchAndCheckbox')),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						_getMySwitch(),

						_getCupertinoSwitch(),

						_getCheckbox(),

						_getMyForm()
					],

				)
			)
		);
	}

	// switch
	Widget _getMySwitch() {
		return Switch(
			value: _switchSelected,
			onChanged: (value) {
				setState(() {
					_switchSelected = value;
				});
			},
			// 选中时圆点颜色
			activeColor: Colors.red,
			// 选中时背景颜色
			activeTrackColor: Colors.black,
			// 未选中时圆点颜色
			inactiveThumbColor: Colors.blue,
			// 未选中时背景颜色
			inactiveTrackColor: Colors.yellow
		);
	}

	// iOS风格的switch
	Widget _getCupertinoSwitch() {
		return CupertinoSwitch(
			value: _cupertinoSelected,
			onChanged: (value) {
				setState(() {
					_cupertinoSelected = value;
				});
			},
			// 选中时背景色
			activeColor: Colors.red
		);
	}

	// checkbox
	Widget _getCheckbox() {
		return Checkbox(
			value: _checkboxSelected,
			onChanged: (value) {
				setState(() {
					_checkboxSelected = value;
				});
			},
			// 选中状态背景色
			activeColor: Colors.black,
			// 选中状态'对号'颜色
			checkColor: Colors.white,
		);
	}

	/* *
	 * Form继承自StatefulWidget对象，对应的状态为FormState
	 *  1、autovalidate：是否自动校验输入内容。为true时，每一个子FormField内容发生变化时，都会自动校验合法性，
	 *      并直接显示错误信息。否则，需要手动调用FormState.validate()来手动校验
	 *  2、onWillPop：决定Form所在的路由是否可以直接返回（如点击返回按钮）。该回调返回一个Future对象，如果Future
	 *      的最终结果为false，则当前路由不会返回；否则正常返回。通常此属性用于拦截返回按钮
	 *  3、onChanged：Form的任意一个子FormField内容发生变化时会触发此回调
	 *
	 *
	 * FormField：Form的子孙元素必须是FormField类型，它是一个抽象类。Flutter提供了一个TextFormField widget，继承自FormField，
	 * 它也是TextField的一个包装类，所以它包含来TextField和FormField的属性。
	 *
	 *
	 * FormState为Form的State类，其常用的三个方法：
	 *  1、FormState.validate()：调用此方法后，会调用Form子孙FormField的validate回调，如果有一个校验失败，则返回false，
	 *      所有校验失败项都会返回用户返回的错误信息
	 *  2、FormState.save()：调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容
	 *  3、FormState.reset()：将子孙FormField的内容清空
	 */

	TextEditingController _nameController = TextEditingController();
	TextEditingController _pwdController = TextEditingController();
	GlobalKey _formKey = GlobalKey<FormState>();

	Widget _getMyForm() {
		return Form(
			key: _formKey, // 设置globalKey，用于后面获取FormState
			autovalidate: true, // 开启自动校验
			child: Container(
				padding: EdgeInsets.only(left: 20, right: 20),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						TextFormField(
							autofocus: false,
							controller: _nameController,
							decoration: InputDecoration(
								labelText: '用户名',
								hintText: '用户名或邮箱',
								icon: Icon(Icons.person)
							),
							// 校验用户名
							validator: (v) {
								// trim去除字符串两端的空格
								return v.trim().length > 0 ? null : '用户名不能为空';
							},
						),

						TextFormField(
							autofocus: false,
							controller: _pwdController,
							obscureText: true,
							decoration: InputDecoration(
								labelText: '密码',
								hintText: '请输入您的密码',
								icon: Icon(Icons.lock)
							),
							// 校验用户名
							validator: (v) {
								// trim去除字符串两端的空格
								return v.trim().length > 5 ? null : '密码不能少于6位';
							},
						),


						// 登录按钮
						Padding(
							padding: EdgeInsets.only(top: 20),
							child: Row(children: <Widget>[
								Expanded(
									child: RaisedButton(
										child: Text('登录'),
										color: Theme.of(context).primaryColor,
										textColor: Colors.white,
										onPressed: () {
											// 通过_formKey.currentState获取FormState后，
											// 调用validate()方法校验用户名密码是否合法，校验通过后再提交数据
											if ((_formKey.currentState as FormState).validate()) {
												// 验证通过
												print('通过');
											} else {
												print('验证失败');
											}
										},
									)
								)
							]),
						)
					],
				),
			),
		);
	}
}