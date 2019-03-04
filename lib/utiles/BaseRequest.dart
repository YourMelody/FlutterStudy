import 'dart:async';
import 'package:dio/dio.dart';
import 'HttpUtil.dart';
import 'package:flutter_app/model/DrugClassModel.dart';
import 'package:flutter_app/model/MedicineItemModel.dart';

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

	// 名医推荐
	static Future<dynamic> getRecomMedicineList({CancelToken cancelToken}) {
		return HttpUtil().get('product/getRecommendProduct', cancelToken: cancelToken).then((data) {
			return (data['data'] as List)?.map((e) =>
				e == null ? null : MedicineItemModel.fromJson(e)
			)?.toList();
		});
	}

	// 分类药品列表
	static Future<dynamic> getMedicineList(String categoryCode, bool hasNode, int page, {CancelToken cancelToken}) {
		return HttpUtil().get('product/listByCategory',
			data: {'categoryCode': categoryCode, 'limit': 10, 'hasNode': hasNode, 'page': page},
			cancelToken: cancelToken).then((data) {
			return (data['data']['list'] as List)?.map((e) =>
			e == null ? null : MedicineItemModel.fromJson(e)
			)?.toList();
		});
	}
}