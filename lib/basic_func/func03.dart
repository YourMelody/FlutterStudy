
// 异常 try/ catch/ throw
void func03() {
	try {
		throw FormatException('format--balabala~~~');

//		throw 'balabala!!!';
	} on FormatException catch(e) {
		print('指定类型的exception：$e');
	} catch (e) {
		print('任意类型：$e');
	}

	_test1();
}

_test1() {
	try {
		int a = _test2();
		print(a);
	} catch (e) {
		print('test1 -- e -- $e');
	}
}

_test2() {
	try {
		throw FormatException('this is exception');
	} on OutOfMemoryError {
		print('out of memory');
	} on FormatException catch (e) {
		print('exception error: $e');
		rethrow;
	} catch (e, r) {
		print('exception details: $e');
		print('stack trace: $r');
	} finally {
		print('this is finally');
	}
}