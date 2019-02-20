
// 数据类型
void func02() {
	// num
//	_aboutNum();

	// list
	_aboutList();

	// map
//	_aboutMap();
}

_aboutMap() {
	Map map0 = {'name': 'aaa', 'age': 18, 111: true, null: null, ['a']: {'xxx':'yyy'}};
	print('map0 = $map0');

	print(map0[111]);
	print(map0[null]);

	Map map1 = new Map();
	map1['name'] = 'aaa';
	map1['age'] = 18;


	Map map2 = new Map<int, String>();
	map2[11] = 'abc';
	map2[11] = 'aaa';
	map2[2] = null;
	print('map2 = $map2');

	assert(map2.containsKey(11));

	map2.remove(11);
	print('map2 = $map2');
}

_aboutList() {
	List list1 = ['a', 10, true, null, ['bala', 'heihei']];
	list1.add('apple');
	list1.addAll(['orange', 'banana']);
	print('${list1.length}, ${list1.first}, ${list1.last}, ${list1[0]}, ${list1.indexOf('apple')}');

	print(list1.removeAt(0));
	
	list1.addAll(['apple', 'apple']);
	list1.remove('apple');
	print(list1);

	list1.removeRange(0, 1);
	print(list1);

	list1.removeWhere((item) => item.runtimeType == String);
	print(list1);

	list1.add(0);
	print(list1);

	list1.add(['a', 'b']);
	print(list1);
}

_aboutNum() {
	double num0 = 3.141592653;
	double num1 = 3.14;
	String str0 = num0.toStringAsFixed(0);
	String str1 = num0.toStringAsFixed(3);
	String str2 = num1.toStringAsFixed(4);
	print('str0 = $str0, str1 = $str1, str2 = $str2');

	double num2 = 12345.678;
	String str3 = num2.toStringAsExponential();
	String str4 = num2.toStringAsExponential(2);
	String str5 = num2.toStringAsExponential(4);
	print('str3 = $str3, str4 = $str4, str5 = $str5');

	double num3 = 123.654;
	int num4 = 1;
	String str6 = num3.toStringAsPrecision(3);
	String str7 = num3.toStringAsPrecision(1);
	String str8 = num4.toStringAsPrecision(2);
	print('str6 = $str6, str7 = $str7, str8 = $str8');

	// bool/assert
	var fullName = '';
	assert(fullName.isEmpty);

	var a = 0 / 0;
	assert(a.isNaN);

	var b;
	assert(b == null);
}