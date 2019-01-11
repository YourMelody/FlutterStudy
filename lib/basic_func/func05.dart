
void func05() {
	Point p0 = Point(10, 20);
	print('p0 = $p0, x = ${p0.x}, y = ${p0.y}, type = ${p0.runtimeType}');

	Point p1 = Point.fromJson({'a': 123, 'b': 456});
	print('p1 = $p1, x = ${p1.x}, y = ${p1.y}');
}

class Point {
	int x;
	int y;
	Point(int a, int b) {
		x = a;
		y = b;
	}

//	Point(this.x, this.y);

//	Point.fromJson(Map data) {
//		x = data['a'];
//		y = data['b'];
//	}

	Point.fromJson(Map data) : x = data['a'], y = data['b'];
}