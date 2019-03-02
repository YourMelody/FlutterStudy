import 'dart:async';
import 'package:dio/dio.dart';
import 'HttpUtil.dart';
import 'package:flutter_app/model/DrugClassModel.dart';

class BaseRequest {
	// 获取药品库
	static Future<dynamic> getDrugClassList(String useSource, {CancelToken cancelToken}) {
		return HttpUtil().get(
			'product/listCategory',
			data: {'useSource': useSource},
			cancelToken: cancelToken).then((data) {
				List tempData = data['data'];
				tempData.insert(0, {
					'hasNode': false,
					'categoryName': '名医推荐',
					'categories': [],
					'categoryCode': ''
				});
				return tempData?.map((e) =>
					e == null ? null : DrugClassModel.fromJson(e)
				)?.toList();
			}
		);
	}
}