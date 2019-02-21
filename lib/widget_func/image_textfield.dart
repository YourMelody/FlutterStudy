import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ImageAndTextFieldDemo extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
        return Scaffold(
	        appBar: AppBar(
		        title: Text('Image'),
	        ),
	        body: Padding(
		        padding: EdgeInsets.all(50),
		        child: Container(
			        alignment: Alignment.center,
			        child: Column(
				        children: <Widget>[
					        _netImageDemo(),
					        Padding(padding: EdgeInsets.only(top: 20)),
					        _localImageDemo(),
					        Padding(padding: EdgeInsets.only(top: 20)),
					        _textFieldDemo0(),
					        Padding(padding: EdgeInsets.only(top: 40)),
					        _textFieldDemo1()
				        ],
			        )
		        ),
	        ),
        );
    }

	/* *
	 * 图片不指定宽高时，会根据当前父容器的限制，尽可能的显示其原始大小；
	 * 只设置了width、height中的一个，另一个默认会按图片原始比例缩放，但可以通过fit属性指定适应规则
	 *
	 * fit:
	 *  1、BoxFit.fill: 会拉伸填充满显示空间，图片宽高比会改变
	 *  2、BoxFit.cover: 图片按比例拉伸填充满空间，不会变形，超出空间部分被裁剪
	 *  3、BoxFit.contain: 图片的默认适应规则，保证长宽比不变的情况下，缩放以适应当前显示空间
	 *  4、BoxFit.fitWidth: 图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，不会变形，超出部分被裁剪
	 *  5、BoxFit.fitHeight: 类比fitWidth
	 *  6、BoxFit.none: 没有适应策略，会在显示空间内显示图片。如果图片比显示空间大，则显示空间只会显示图片中间部分
	 *
	 * color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式
	 *
	 * repeat: 当图片本身小于显示空间，指定图片的重复规则
	 */


    // 加载网路图片
    _netImageDemo() {
		// 下面这两种写法效果一样

//	    return Image.network(
//		    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2527385882,2413489660&fm=26&gp=0.jpg',
//		    fit: BoxFit.contain,
//		    width: 120
//	    );

        return Image(
	        image: NetworkImage('https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2527385882,2413489660&fm=26&gp=0.jpg'),
	        fit: BoxFit.contain,
	        width: 120,
        );
    }

	// 加载本地资源图片
	_localImageDemo() {
		// 这两种写法效果一样
		return Image.asset(
			'lib/images/my_icon.png',
			width: 120,
			fit: BoxFit.fitWidth,
			color: Colors.yellow,
			colorBlendMode: BlendMode.difference
		);
//		return Image(image: AssetImage('lib/images/my_icon.png'), width: 120);
	}


    _textFieldDemo0() {
		return TextField(
			maxLength: 30,
			maxLines: 1,
			autofocus: false,
			obscureText: false,
			textAlign: TextAlign.left,
			style: TextStyle(
				fontSize: 17,
				color: Colors.black
			),
			onChanged: (text) {
				print('onChanged:--$text--');
			},
			onSubmitted: (text) {
				print('onSubmitted:--$text--');
			},
			decoration: InputDecoration(
				filled: false,
				hintText: 'placeholder',
				helperText: 'helperText',
				labelText: 'labelText',
				fillColor: Colors.red
			),
			enabled: true,
			onEditingComplete: () {
				print('TextField:complete');
			}
		);
    }

    // iOS风格的TextField
    _textFieldDemo1() {
		return CupertinoTextField(
			maxLength: 200,
			maxLines: 1,
			autofocus: false,
			// 密码
			obscureText: false,
			autocorrect: false,
			textAlign: TextAlign.left,
			style: TextStyle(
				fontSize: 17,
				color: Colors.black
			),
			onChanged: (text) {
				print('onChanged:--$text--');
			},
			onSubmitted: (text) {
				print('onSubmitted:--$text--');
			},
			placeholder: 'placeholder',
			clearButtonMode: OverlayVisibilityMode.editing,
			enabled: true,
			// 设置光标宽度，默认为2
			cursorWidth: 2,
			// 设置光标颜色，默认为blue
			cursorColor: Colors.red,
			// 在onSubmitted之前调用。实现了该方法后，按return不会让textField失去焦点
			onEditingComplete: () {
				print('CupertinoTextField:complete');
			}
		);
    }
}