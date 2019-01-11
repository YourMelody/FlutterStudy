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
				        	_imageDemo(),
					        Padding(padding: EdgeInsets.only(top: 40)),
					        _textFieldDemo0(),
					        Padding(padding: EdgeInsets.only(top: 40)),
					        _textFieldDemo1()
				        ],
			        )
		        ),
	        ),
        );
    }

    _imageDemo() {
	    return Image.network(
		    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2527385882,2413489660&fm=26&gp=0.jpg',
		    fit: BoxFit.contain,
	    );
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
				labelText: 'labelText'
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