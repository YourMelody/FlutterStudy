
// 函数参数
void func04() {
	// 可选命名参数
	_testPar1(123, name: 'abc');
	_testPar1(123, age: 18);
	_testPar1(123, name: 'aaa', age: 18);

	// 可选位置参数
	_testPar2(123);
	_testPar2(123, 'beijing');
	_testPar2(123, 'beijing', 10);
	// 错误写法
//	_testPar2(123, 10);
}

void _testPar1(int a, {String name, int age = 10}) {
	print('a = $a, name = $name, age = $age');
}

void _testPar2 (int a, [String str = 'abc', int b]) {
	print('a = $a, str = $str, b = $b');
}