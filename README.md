# 一、Dart基础

## 1、一些重要的概念

* _Dart_ 所有的东西都是对象，即使是数字、函数、null也都是对象。所有的对象都继承自 Object 类。
* _Dart_ 动态类型语言, 尽量给变量定义一个类型，会更安全，没有显示定义类型的变量在 debug 模式下该类型是 dynamic(动态的)。
* _Dart_ 在 running 之前解析你的所有代码，指定数据类型和编译时的常量，可以提高运行速度。
* _Dart_ 没有public、private和protected关键字。如果标识符以下划线(_)开头，则该标识符对其库是私有的。
* 没有初始化的变量都会被赋予默认值 null。
* final的值只能被设定一次。const 是一个编译时的常量，可以通过 const 来创建常量值，var c=const[];这里 c 还是一个变量，只是被赋值了一个常量值，它还是可以赋其它值。

## 2、_Dart_ 中的关键字
![关键字](https://github.com/YourMelody/yourmelody.github.io/blob/master/2018/12/29/Dart2基础篇/dart_keyword.png)

## 3、常量与变量
name的类型被推断为String:
> var name = 'Bob';

如果对象不限于单一类型，或没有明确的类型，可用dynamic/Object:

```dart
Object name1 = 'zf';
print('name1: ${name1.runtimeType}'); // String
name1 = ['a', 'b'];
print('name1: ${name1.runtimeType}'); // List<String>

dynamic name2 = 'zf';
print('name2: ${name2.runtimeType}'); // String
name2 = 123;
print('name2: ${name2.runtimeType}'); // int
```

显式声明变量的类型:
> String name = 'Bob';

所有未初始化的变量默认值都是null

```dart
int lineCount;
// 在生产环境，assert()会被忽略。
// 在开发环境，assert(condition)的condition不为真时抛出一个异常。
assert(lineCount == null);
```

如果某个变量只打算设置一次值，请使用final或const修饰。final变量只能被初始化一次，const变量是一个编译时常量（const变量是隐式的final）。final修饰的变量在第一次声明的时候就要初始化。被final或者const修饰的变量，类型可以省略，但建议指定类型：

```dart
// 可以省略String这个类型声明
final name0 = 'Bob';
final String name1 = 'Bob';

const name2 = 'Bob';
const String name3 = 'Bob';
```

被final或const修饰的变量值不能再修改。final或const不能和var同时使用。常量如果是类级别的，建议使用static const：
> static const String name = 'Tom';

const关键字不只是声明常数变量，还可以用来创建常量值，以及声明创建常量值的构造函数。任何变量都可以有一个常量值：

```dart
// 注意：[]创建的是一个空的list集合
// const []创建一个空的，不可变的列表
var varList = const [];
final finalList = const [];
const constList = const [];

// 可以更改非final/const变量的值，即便它曾经具有const的值
varList = ['hahaha'];
```

在常量表达式中，final/const的操作对象必须为bool、num、string或null，const常量必须用const类型的值初始化：

```dart
const String name0 = 'a';
final String name1 = 'a';
const String name2 = 'a';
const aConstList = const ['1', '2'];

// 报错：Const variables must be initialized with a constant value
const validConstString0 = '$name0 $name1';

// 报错：In constant expressions, operands of this operator must be of type 'bool', 'num', 'String' or 'null'
const validConstString1 = '$name0 $name2 $aConstList';

// 正确写法
const validConstString2 = '$name0 $name2';
```

## 4、数据类型
* __num:__ 是数字类型的父类，有两个子类 int 和 double

```dart
int a = 1;
print(a);

double b = 1.11;
print(b);

// String -> int
int c = int.parse('1');

// String -> double
double d = double.parse('1.11');

// int -> String
String str1 = a.toString();

// 报错：The argument type 'int' can't be assigned to the parameter type 'String'
print(str1 + a);

// 正确
// print('${str1} ${a}');
print(str1 + a.toString());


// double -> String，
// toStringAsFixed()
// 参数表示要保留几位小数，参数必填
// 填写的整数值大于小数的小数点位数时，会补0
// 返回结果四舍五入
double num0 = 3.141592653;
double num1 = 3.14;
String str0 = num0.toStringAsFixed(0);
String str1 = num0.toStringAsFixed(3);
String str2 = num1.toStringAsFixed(4);
// str0 = 3, str1 = 3.142, str2 = 3.1400
print('str0 = ${str0}, str1 = ${str1}, str2 = ${str2}');

// toStringAsExponential()
// 科学计数，参数可为空，参数表示要保留几位小数，会四舍五入
double num2 = 12345.678;
String str3 = num2.toStringAsExponential();
String str4 = num2.toStringAsExponential(0);
String str5 = num2.toStringAsExponential(4);
// str3 = 1.2345678e+4, str4 = 1e+4, str5 = 1.2346e+4
print('str3 = ${str3}, str4 = ${str4}, str5 = ${str5}');

// toStringAsPrecision()
// 参数必填且>0, 表示有效数字的位数，也会四舍五入
double num3 = 123.654;
int num4 = 1;
String str6 = num3.toStringAsPrecision(3);
String str7 = num3.toStringAsPrecision(1);
String str8 = num4.toStringAsPrecision(2);
// str6 = 124, str7 = 1e+2, str8 = 1.0
print('str6 = ${str6}, str7 = ${str7}, str8 = ${str8}');
```

* __String:__ 可以使用单引号/双引号创建字符串；引号可以嵌套使用

```dart
String str1 = 'aaaaa';
String str2 = 'bbbbb';
int a = 1;

String str3 = '$str1 a "b" ${str2.toUpperCase()} ${a.toString()}';
```

* __bool__ 
	* _Dart_ 是强bool类型检查，只有bool类型的值是true，才被认为是true
	* 只有两个对象具有bool类型：true和false，它们都是编译时常量
	* assert 是语言内置的断言函数，仅在检查模式下有效。条件不为真则引发异常
	
```dart
var fullName = '';
assert(fullName.isEmpty);

var a = 0 / 0;
assert(a.isNaN);

var b;
assert(b == null);
```

* __List集合:__ 元素类型可以是任意类型

```dart
// 使用List的构造函数。如果传递int参数，表示List固定长度，不可增删操作
List list0 = new List();

List list1 = ['a', 10, true, null, ['bala', 'heihei']];

// 添加一个元素
list1.add('apple');

// 添加多个元素
list1.addAll(['orange', 'banana']);

// 获取List的长度/首个元素/最后一个元素/指定下标元素/某个元素的索引
print('${list1.length}, ${list1.first}, ${list1.last}, ${list1[0]}, ${list1.indexOf('apple')}');

// 删除指定位置的元素，返回被删除的元素
print(list1.removeAt(0));

// 删除指定元素，返回true/false。如果集合中有多个相同元素，只会删除第一个
list1.remove('apple');

// 删除最后一个元素，返回被删除的元素
print(list1.removeLast());

// 删除指定范围的元素，含头不含尾，没有返回值
list1.removeRange(0, 1);

// 删除指定条件的元素，没有返回值
list1.removeWhere((item) => item.runtimeType == String);

// 删除所有的元素，没有返回值
list1.clear();
```

* __Map集合:__ map的键和值可以是任何类型的对象

```dart
// 这种方式初始化map时，key不能相同，否则报错：Two keys in a map literal can't be equal.
Map map0 = {'name': 'aaa', 'age': 18, 111: true, null: null, ['a']: {'xxx':'yyy'}};

// 另一种创建方式
Map map1 = new Map();
map1['name'] = 'aaa';
map1['age'] = 18;

// 指定键值对的参数类型。如果指定了key/value类型，赋值时必须为指定的类型
Map map2 = new Map<int, String>();
// 对同一key进行赋值会被覆盖
map2[1] = 'abc';
map2[1] = 'aaa';
// map里面的value和key都可以是null
map2[2] = null;

// 检索Map是否含有某key
assert(map2.containsKey(1));

// 删除某个键值对(参数为key值)
map2.remove(1);
```

## 5、异常(Exception)

* __throw__

抛出固定类型的异常

> throw new FormatException('Expected at least 1 section');

抛出任意类型的异常

> throw 'Out of memory!';

* __on / catch__

将可能出现异常的代码放到 try 语句中，可以通过 on 语句来指定需要捕获的异常类型；使用 catch 可以捕获到任意异常类型。rethrow可以重新抛出捕获的异常

```dart
test1() {
    try {
        test2();
    } catch (e) {
        print('test1 -- e -- ${e}');
    }
}

test2() {
    try {
        throw FormatException('this is exception');
    } on OutOfMemoryError { // 可以捕获指定类型的异常
        print('out of memory');
    } on FormatException catch (e) { // 匹配不到FormatException，会继续匹配
        print('exception error: ${e}');
        // 重新抛出异常，可以在test1的catch中重新捕获异常
        rethrow; 
    } catch (e, r) { // 匹配所有类型的异常：e是异常对象，r时异常的堆栈信息
        print('exception details: ${e}');
        print('stack trace: ${r}');
    } finally { // 一定会执行，如果try/catch中有return/rethrow，会在return/rethrow之前执行
        print('this is finally');
    }
}
```

## 6、函数(Function)

_Dart_ 的函数有两种类型的参数：必需的和可选的。可选参数可以有一个默认值，在调用者没有指定可选参数时使用默认值。可选参数又分为：可选命名参数和可选位置参数。

* __可选命名参数:__ 使用{}包围的参数属于可选命名参数，可设置默认值，在调用的时候，需要使用paramName:value的形式指定为哪个可选参数赋值。

```dart
void _testPar1(int a, {String name, int age = 10}) {
    print('a = ${a}, name = ${name}, age = ${age}');
}

_testPar1(123, name: 'abc'); // a = 123, name = abc, age = 10
_testPar1(123, age: 18); // a = 123, name = null, age = 18
_testPar1(123, name: 'aaa', age: 18); // a = 123, name = aaa, age = 18
```

* __可选位置参数:__ 使用[]包围的参数属于可选位置参数。如果想指定某个位置上的参数，必须保证前面位置有参数（设置了默认参数也需要传）。

```dart
void _testPar2 (int a, [String str = 'abc', int b]) {
    print('a = ${a}, str = ${str}, b = ${b}');
}

_testPar2(123); // a = 123, str = abc, b = null
_testPar2(123, 'beijing'); // a = 123, str = beijing, b = null
_testPar2(123, 'beijing', 10); // a = 123, str = beijing, b = 10
_testPar2(123, 10); // 会报错
```

## 7、类的构造函数

```dart
class Point {
    int x;
    int y;
	
    // 构造函数
    Point(int a, int b) {
       x = a;
       y = b;
    }
	
    // 上面的构造函数可以简化为：
    Point(this.x, this.y);
	
    // 命名构造函数
    Point.fromJson(Map data) {
        x = data['x'];
        y = data['y'];
    }
	
    // 可以在构造函数打括号前来初始化实例的变量值，多个实例变量用逗号隔开
    Point.fromJson(Map data) : x = data['x'], y = data['y'];
}
```

## 8、_Dart_ 中的异步

* __Event-Looper__

	_Dart_ 是单线程模型，也就没有所谓的主线程/子线程。 _Dart_ 也是Event-Looper以及Event-Queue的模型，所有的事件都是通过EventLooper依次执行。 _Dart_ 的Event Loop是：
	
	* 从EventQueue中获取Event
	* 处理Event
	* 直到EventQueue为空

	![Event Queue](Dart2基础篇/dart_eventqueue.png)

	这些Event包括了用户输入，点击，Timer，文件IO等

	![Event Queue](Dart2基础篇/dart_eventtype.png)

* __单线程模型__

	_Dart_ 中没有线程的概念，只有isolate，每个isolate都是隔离的，并不会共享内存。一个 _Dart_ 程序是在Main isolate的main函数开始，在main函数结束后，Main isolate开始一个一个的处理Event Queue中的每一个Event。

	![Event Queue](Dart2基础篇/dart_isolate.png)

* __Event Queue以及Microtask Queue__

	 _Dart_ 中的Main isolate只有一个Event Looper，但存在两个Queue：Event Queue和Microtask Queue。Microtask Queue存在的意义是：
	> 希望通过这个Queue来处理稍晚一些，但是在下一个消息到来之前需要处理完的事情。
	
	当Event Looper正在处理Microtask Queue中的Event时，Event Queue中的Event就停止了处理，此时App不能绘制任何图形，不能处理任何鼠标点击，不能处理文件IO等。
	
	Event-Looper挑选Task的执行顺序为：
	
	* 优先全部执行完Microtask Queue中的Event
	* 直到Microtask Queue为空时，再执行Event Queue中的Event
	
	![Event Queue](Dart2基础篇/dart_microtaskqueue.png)
	
	 _Dart_ 中只知道Event处理的先后顺序，并不知道某个Event执行的具体时间点。
	
* __异步任务调度__

	当有代码可以在后续任务执行的时候，有两种方式，通过 _dart:async_ 中的API即可
	* 使用Future类，可以将任务加入到Event Queue的队尾
	
	```dart
	// 一般常用的Future构造函数
	new Future(() {
	    // do something
	});
	
	// 当需要将任务拆分成很多小任务一步一步执行时，可以使用Future.then来拆解任务
	new Future(() {
	    print('abc');
	    return 21;
	}).then((value) => '!!!then01 $value!!!') //这里的value是上面任务的返回值
	  .then((value) {
	    // 这里的value为上一个任务执行完的返回结果
	    print('===then02 $value==='); // ===then02 !!!then01 21!!!===
	    return 'balabala';
	}).then((value){
	    // 这里的value是上个任务的返回值
	    print('~~~then03 $value~~~~'); // ~~~then03 balabala~~~~
	}).whenComplete(() {
	    print('complete');
	});
	
	// 当任务需要延时执行，可以使用Future.delay。不是绝对精准的。
	new Future.delayed(const Duration(seconds: 1), () {print('123');});
	```
	* 使用scheduleMicrotask函数，将任务加入到Microtask Queue队尾
	
	```dart
	import 'dart:async';
	
	void main() {
	    new Future.delayed(const Duration(seconds: 1), () {print('delay');});
		
	    print('main---111');
		
	    scheduleMicrotask(() {
	        print('microtask---111');
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
	        print('microtask---222');
	    });
		
	    print('main---222');
	}
	```
	> 上面代码的输出顺序为：
	>> main---111
	>> main---222
	>> microtask---111
	>> microtask---222
	>> future
	>> future-then-21
	>> complete
	>> delay
	
	* 再看一个较复杂的例子
	
	```dart
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
	```
	> 上面输出顺序为：0-5-b-1-2-4-3-6-7-9-a-8
	
* __async和await__
	
	```dart
	// async关键字声明该函数内部有延时执行的任务
	asyncAndAwait() async {
	    // 在Dart中，有await修饰的，其结果是一个Future对象
	    var a = await test0();
	    print('a-type:${a.runtimeType}');
	    print('a = ${a}');

	    var b = await test1();
	    print('b-type:${b.runtimeType}');
	    print('b = ${b}');
	}
	
	test0() {
	    return Future(() => '22222');
	}
		
	test1() {
	    return Future(() => '22222')
	        .then((value) {
	        print('then-value=${value}');
	    }).whenComplete(() {
	        print('complete~');
	    });
	}
	```
	> 上面代码的输出顺序依次为：
	>> a-type:String
	>> a = 11111
	>> then-value=22222
	>> complete~
	>> b-type:Null
	>> b = null
