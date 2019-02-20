
// 常量和变量的基本使用
void func01() {
	// var
	var name0 = 'zf';
	print('name0: ${name0.runtimeType}');

	// 报错，var修饰的变量在第一次初始化后进行类型推断，之后不能赋值为其他类型
//	name0 = 1;

	// dynamic/Object
	Object name1 = 'zf';
	print('name1: ${name1.runtimeType}');
	name1 = ['a', 'b'];
	print('name1: ${name1.runtimeType}');

	dynamic name2 = 'zf';
	print('name2: ${name2.runtimeType}');
	name2 = 123;
	print('name2: ${name2.runtimeType}');


	// null
	int a;
	// assert
	try {
		assert(a == null);
//		assert(a == 0);
	} on AssertionError catch (e) {
		print('assert 抛出的异常 $e');
	} catch(e) {
		print('other $e');
	}

//	var tempList = const [];
//	tempList = ['abc'];


	const String tempName0 = 'a';
//	final String tempName1 = 'a';
	const String tempName2 = 'a';
	const aConstList = const ['1', '2'];

	// 报错：Const variables must be initialized with a constant value
//	const validConstString0 = '$tempName0 $tempName1';
	// 正确写法
	const validConstString1 = '$tempName0 $tempName2 balabala';

	// 报错：In constant expressions, operands of this operator must be of type 'bool', 'num', 'String' or 'null'
//	const validConstString2 = '$tempName0 $tempName2 $aConstList';

	//正确写法
	var validConstString3 = '$tempName0 $tempName2 $aConstList';

	print('str1 = $validConstString1, str2 = $validConstString3');
}