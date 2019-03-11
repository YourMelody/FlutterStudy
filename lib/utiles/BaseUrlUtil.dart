
class BaseUrl {
	// 0--开发    1--测试    2--线上
	static int JK_APP_DEBUG_SETTING = 2;

	// 用户信息
	BjUrl() {
		switch(JK_APP_DEBUG_SETTING) {
			case 0:
				return "http://bj-api.d.jianke.com/";
			case 1:
				return "https://bjtest.jianke.com/";
			case 2:
				return "https://bj-api.jianke.com/";
		}
	}

	GDUrl() {
		switch(JK_APP_DEBUG_SETTING) {
			case 0:
				return "http://app-gateway.dev.jianke.com/";
			case 1:
				return "http://app-gateway.dev.jianke.com/";
			case 2:
				return "https://acgi.jianke.com/";
		}
	}
}