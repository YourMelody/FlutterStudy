import 'package:flutter/material.dart';

class WidgetDemo1 extends StatelessWidget {
	final String text;
	WidgetDemo1(this.text);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('StatelessWidget'),
			),
			body: Container(
				color: Colors.white,
				padding: EdgeInsets.only(top: 100),
				child: Column(
					children: <Widget>[
						MyStateless(),
						MyStateful()
					],
				),
			),
		);
	}
}

class MyStateless extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	    return  Text(
		    '无状态的Widget',
		    textAlign: TextAlign.center,
	    );
    }
}

class MyStateful extends StatefulWidget {
	@override
	State<MyStateful> createState() {
		return _MyStatefulState();
    }
}

class _MyStatefulState extends State<MyStateful> {
	int pressCount;
	@override
	void initState() {
		super.initState();
		pressCount = 0;
	}

	@override
    void didChangeDependencies() {
        super.didChangeDependencies();
        print('change!!!');
    }

	@override
    void dispose() {
		super.dispose();
		print('dispose~~~');
    }

	@override
	Widget build(BuildContext context) {
		print('build');
        return FlatButton(
	        onPressed: () {
		        setState(() {
			        pressCount++;
		        });
	        },

	        child: Center(
		        child: Text('有状态的Widget，可戳👇--$pressCount'),
	        )
        );
    }
}

