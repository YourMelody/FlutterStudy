/**
 *  网络请求工具类
 */

import 'package:dio/dio.dart';
import 'BaseUrlUtil.dart';

class HttpUtil {
	static HttpUtil instance;
	Dio dio;
	BaseOptions options;

	static HttpUtil getInstance() {
		if(instance == null){
			instance = new HttpUtil();
		}
		return instance;
	}

	HttpUtil() {
		Map<String, dynamic> optHeader = {
			'traceinfo': 'versionName=2.6.1;versionCode=20190401;appName=%E5%81%A5%E5%AE%A2%E8%A1%8C;model=iPhone8,2;clientname=iPhone;channelId=10000;idfa=EE6C1572-06B5-4415-931A-247618068190;loginSource=2;deviceUuid=6815F5E3FE06436DBD6C0AD8DCFC970F;source=2;applicationCode=jkAgent;userId=8271;userToken=ed23c061d7e300672f7a83267463f902',
			'user-agent': 'HotSpot',
			'accept-language': 'zh-cn',
			'content-type': 'application/json'
		};

		options = BaseOptions(
			//连接服务器超时时间，单位是毫秒.
			connectTimeout: 30000,
			headers: optHeader
		);
		dio = new Dio(options);

		(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
			// 设置代理
			client.findProxy = (uri) {
				return 'PROXY 192.168.36.86:8888';
			};
		};
	}

	// get
	get<T>(url, {baseUrl, data, options, cancelToken}) async {
		Response<T> response;
		try{
			if (baseUrl == null) {
				dio.options.baseUrl = BaseUrl().BjUrl();
			} else {
				dio.options.baseUrl = baseUrl;
			}
			response = await dio.get<T>(
				url,
				queryParameters: data,
				cancelToken: cancelToken
			);
			return response.data;
		} on DioError catch(e){
			return null;
		}
	}

	// post
	post<T>(url, {baseUrl, data, options, cancelToken}) async {
		Response<T> response;
		try{
			if (baseUrl == null) {
				dio.options.baseUrl = BaseUrl().BjUrl();
			} else {
				dio.options.baseUrl = baseUrl;
			}
			response = await dio.post<T>(
				url,
				data: data,
				cancelToken: cancelToken
			);
			return response.data;
		} on DioError catch(e){
			return null;
		}
	}
}


/**
 * 调用方式
 *  var result = await JkMethodChannel.platform.invokeMethod("getReqHeader");
 *	var response = await HttpUtil(result).get("", data: {"": "");
 *	print(response);
 */