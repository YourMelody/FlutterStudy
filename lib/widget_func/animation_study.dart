import 'package:flutter/material.dart';

class AnimationStudy extends StatefulWidget {
	AnimationStudy({Key key, this.titleStr}) : super(key: key);
	final String titleStr;
	@override
	createState() => new _AnimationStudy();
}

class _AnimationStudy extends State<AnimationStudy> with TickerProviderStateMixin {
	AnimationController aniCon;
	Animation animation;
	int moveCount = 0;
	double endValue = 100.0;

	@override
	void initState() {
		super.initState();
		aniCon = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
		animation = Tween(begin: 0.0, end: endValue).animate(aniCon);
		animation.addListener(() {
			setState(() {});
		});
		animation.addStatusListener((status) {
			if (status == AnimationStatus.completed) {
			
			}
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold (
			appBar: AppBar(
				title: Text(widget.titleStr),
			),
			body: _moveAni(),
			floatingActionButton: FloatingActionButton(
				tooltip: 'Fade',
				child: Icon(Icons.brush),
				onPressed: () {
					
					if ((moveCount ~/ 2) % 2 == 0) {
						aniCon.forward();
					} else {
						aniCon.reverse();
					}
					
					moveCount++;
					setState(() {
						endValue = 100.0 * moveCount;
					});
				},
			),
		);
	}
	
	_moveAni() {
		return Container(
			color: Colors.blue,
			width: MediaQuery.of(context).size.width/3.0,
			margin: EdgeInsets.only(left: animation.value),
			child: Text('')
		);
	}

	@override
	void dispose() {
		aniCon.dispose();
		super.dispose();
	}
}