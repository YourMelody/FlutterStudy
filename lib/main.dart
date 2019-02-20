
/**
 * Flutter中常用的布局有Container、Padding、Center、Flex、Stack、Row、Column、ListView等
 * 1、Container：只能有一个子Widget，默认充满，包含了padding、margin、color、宽高、decoration（一般配置边框和阴影）等配置
 * 2、Padding：只有一个子Widget，只用于设置padding，常用于嵌套child，给child设置padding
 * 3、Center：只有一个子Widget，只用于居中显示
 * 4、Stack：可以有多个子Widget，子Widget堆叠在一起
 * 5、Column：可以有多个子Widget，垂直布局
 * 6、Row：可以有多个Widget，水平布局
 * 7、Expanded：只有一个子Widget，在Column和Row中会平均铺满，也可以设置flex决定比例
 * 8、ListView：可以有多个子Widget
 *
 *
 * 常用的Widget简单介绍
 * 1、MaterialApp：一般作为App顶层的主页入口，可配置主题，路由等
 * 2、Scaffold：一般用户页面的承载Widget，包含appbar、snackbar、drawer等material design的设定
 * 3、Appbar：一般用于Scaffold的appbar，内有标题，二级页面返回按键等
 * 4、Text：显示文本，通过style设置TextStyle来设置字体样式
 * 5、RichText：富文本，通过设置TextSpan可以拼接出富文本场景
 * 6、TextField：文本输入框 TextField(controller: 文本控制器, obscureText: hint文本);
 * 7、Image：加载图片 FadeInImage.assetNetwork(placeholder: "预览图", fit: BoxFit.fitWidth, image: "url");
 * 8、FlatButton：按钮 FlatButton(onPressed: () {}, child: Container());
 * */


/**
 * Flutter使用配置文件pubspec.yaml来管理第三方依赖包，该配置文件中各个字段的含义：
 * 1、name：应用或包名称
 * 2、description：应用或包的描述、简介
 * 3、version：应用或包的版本号
 * 4、dependencies：应用或包依赖的其它包或插件
 * 5、dev_dependencies：开发环境依赖的工具包（不是flutter应用本身依赖的包）
 * 6、flutter：flutter相关的配置选项
 */



import 'package:flutter/material.dart';
import 'widget_func/state_widget.dart';
import 'widget_func/container_widget.dart';
import 'widget_func/column_row.dart';
import 'package:flutter_app/my_demo/tabbar_widget.dart';
import 'widget_func/image_textfield.dart';
import 'widget_func/button_widget.dart';

// 计时器示例
import 'my_demo/01_jishuqi.dart';

// 应用入口
void main() {
	// runApp该方法作用是启动Flutter应用，它接收一个Widget参数
	runApp(MaterialApp(
		home: MyTabBarWidget(),
		// 隐藏顶部状态栏的debug样式
		debugShowCheckedModeBanner: false,
		theme: ThemeData(primarySwatch: Colors.blue),
		// 这里定义静态路由，只能在注册路由的时候传递参数，可以在手动调用pop的时候返回参数
		routes: <String, WidgetBuilder> {
			'/state_widget': (_) => WidgetDemo1('有状态/无状态的Widget'),
			'/container_widget': (_) => ContainerDemo(),
			'/image_textfield': (_) => ImageAndTextFieldDemo(),
			'/column_row': (_) => ColumnAndRow(),
			'/button_widget': (_) => MyButtonDemo(),
			'/jishuqi_demo': (_) => JiShuQi(title: '计数器示例'),
		},
	));
}

