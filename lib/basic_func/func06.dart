
// 异步
import 'dart:async';

void func06() {
	_eventQueue();

//	_microTaskQueue1();

//	_microTaskQueue2();

//	_asyncAndAwait();
}

_eventQueue() {
	print('====start====');

	new Future(() {
		print('a new future');
	});

	new Future(() {
		print('abc');
		return 21;
	}).then((value) => 'then01-value:$value')
		.then((value) {
		print('then02-value:$value');
		return 'balabala';
	}).then((value){
		print('then03-value:$value');
	}).whenComplete(() {
		print('complete');
	});

	new Future.delayed(const Duration(seconds: 1), () {print('123');});

	print('====end====');
}

_microTaskQueue1() {
	print('main----111');

	scheduleMicrotask(() {
		print('microtask----111');
	});

	new Future(() {
		print('future');
		return 21;
	}).then((value) {
		print('future-then-$value');
	}).whenComplete(() {
		print('complete');
	});

	scheduleMicrotask(() {
		print('microtask----222');
	});

	print('main----222');
}

_microTaskQueue2() {
	scheduleMicrotask(() => print('000'));

	new Future(() => print('111'))
		.then((_) {
			print('222');
			scheduleMicrotask(() => print('333'));
	}).then((_) => print('444'));

	scheduleMicrotask(() => print('555'));

	new Future(() => print('666'))
		.then((_) {
		print('777');
		Future(() => print('888'));
	}).then((_) => print('999'));

	new Future(() => print('aaa'));

	scheduleMicrotask(() => print('bbb'));
}

_asyncAndAwait() async {
	var a = await _test0();
	print('a-type:${a.runtimeType}');
	print('a = ${a}');

	var b = await _test1();
	print('b-type:${b.runtimeType}');
	print('b = ${b}');
}

_test0() {
	return Future(() => '11111');
}

_test1() {
	return Future(() => '22222')
		.then((value) {
		print('then-value=$value');
	}).whenComplete(() {
		print('complete~');
	});
}