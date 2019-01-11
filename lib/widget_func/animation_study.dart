import 'package:flutter/material.dart';

class AnimationStudy extends StatefulWidget {
	AnimationStudy({Key key, this.titleStr}) : super(key: key);
	final String titleStr;
	@override
	createState() => new _AnimationStudy();
}

class _AnimationStudy extends State<AnimationStudy> with TickerProviderStateMixin {
	AnimationController aniCon;
	CurvedAnimation curveAni;
	bool aniStatus = false;

	@override
	void initState() {
		super.initState();
		aniCon = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
		curveAni = CurvedAnimation(parent: aniCon, curve: Curves.easeInOut);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold (
			appBar: AppBar(
				title: Text(widget.titleStr),
			),
			body: Center(
				child: Container(
					child: FadeTransition(
						opacity: curveAni,
						child: FlutterLogo(
							size: 120.0,
						),
					),
				),
			),
			floatingActionButton: FloatingActionButton(
				tooltip: 'Fade',
				child: Icon(Icons.brush),
				onPressed: () {
					if (aniStatus) {
						aniCon.reverse();
					} else {
						aniCon.forward();
					}
					aniStatus = !aniStatus;
				},
			),
		);
	}

	@override
	dispose() {
		aniCon.dispose();
		super.dispose();
	}
}