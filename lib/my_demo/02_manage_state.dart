import 'package:flutter/material.dart';

class ManageState extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('状态管理')),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text('1、Widget管理自身状态'),
						_TapBoxA(),

						Padding(padding: EdgeInsets.only(bottom: 20)),

						Text('2、父Widget管理子Widget的状态'),
						_ParentWidgetA(),

						Padding(padding: EdgeInsets.only(bottom: 20)),

						Text('3、混合状态管理'),
						_ParentWidgetB()
					],
				),
			),
		);
	}
}

// 1、Widget管理自身状态
class _TapBoxA extends StatefulWidget {
	_TapBoxA({Key key}) : super(key: key);

	@override
	_TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<_TapBoxA> {
	bool _active = false;

	void _handleTap() {
		setState(() {
			_active = !_active;
		});
	}

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: _handleTap,
			child: Container(
				child: Center(
					child: Text(
						_active ? 'Active' : 'Inactive',
						style: TextStyle(fontSize: 28.0, color: Colors.white)
					),
				),
				width: 160,
				height: 60,
				decoration: BoxDecoration(
					color: _active ? Colors.lightGreen[700] : Colors.grey[600]
				),
			),
		);
	}
}




// 2、父Widget管理子Widget的状态
class _ParentWidgetA extends StatefulWidget {
	@override
	_ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<_ParentWidgetA> {
	bool _active = false;

	void _handleTapBoxChanged(bool newValue) {
		setState(() {
			_active = newValue;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _TapBoxB(
			active: _active,
			onChanged: _handleTapBoxChanged
		);
	}
}

class _TapBoxB extends StatelessWidget {
	_TapBoxB({
		Key key,
		this.active: false,
		@required this.onChanged
	}) : super (key: key);

	final bool active;
	final ValueChanged<bool> onChanged;

	void _handleTap() {
		onChanged(!active);
	}

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: _handleTap,
			child: Container(
				child: Center(
					child: Text(
						active ? 'Active' : 'Inactive',
						style: TextStyle(fontSize: 28.0, color: Colors.white)
					),
				),
				width: 160,
				height: 60,
				decoration: BoxDecoration(
					color: active ? Colors.lightGreen[700] : Colors.grey[600]
				),
			),
		);
	}
}


// 3、混合状态管理
class _ParentWidgetB extends StatefulWidget {
	@override
	_ParentWidgetBState createState() => _ParentWidgetBState();
}

class _ParentWidgetBState extends State<_ParentWidgetB> {
	bool _active = false;

	_handleTapBoxChanged(bool newValue) {
		setState(() {
			_active = newValue;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _TapBoxC(
			active: _active,
			onChanged: _handleTapBoxChanged,
		);
	}
}

class _TapBoxC extends StatefulWidget {
	_TapBoxC({
		Key key,
		this.active: false,
		@required this.onChanged
	}) : super(key: key);

	final bool active;
	final ValueChanged<bool> onChanged;

	@override
	_TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<_TapBoxC> {
	bool _highlighted = false;

	_handleTap() {
		widget.onChanged(!widget.active);
	}

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: _handleTap,
			onTapDown:  (TapDownDetails details) {
				setState(() {
					_highlighted = true;
				});
			},
			onTapCancel: () {
				setState(() {
					_highlighted = false;
				});
			},
			onTapUp: (TapUpDetails details) {
				setState(() {
					_highlighted = false;
				});
			},
			child: Container(
				child: Center(
					child: Text(
						widget.active ? 'Active' : 'Inactive',
						style: TextStyle(fontSize: 28.0, color: Colors.white)
					),
				),
				width: 160,
				height: 60,
				decoration: BoxDecoration(
					color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
					border: _highlighted ? Border.all(
						color: Colors.blue,
						width: 10.0
					) : null
				),
			),
		);
	}
}
