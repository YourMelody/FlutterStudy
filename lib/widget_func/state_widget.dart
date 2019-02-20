import 'package:flutter/material.dart';

/*
* 可以简单认为StatefulWidget和StatelessWidget有两点不同
* 1、StatefulWidget可以拥有状态，这些状态在生命周期中可变，而StatelessWidget是不可变的。
* 2、StatefulWidget至少由两个类组成：StatefulWidget类和State类。StatefulWidget类本身是
*   不可变的，但State类中持有的状态在widget生命周期中可变。
* */

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

