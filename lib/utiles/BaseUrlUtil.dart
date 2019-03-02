
class BaseUrl {
	// 0--开发    1--测试    2--线上
	static int JK_APP_DEBUG_SETTING = 1;

	// 用户信息
	BjUrl() {
		switch(JK_APP_DEBUG_SETTING) {
			case 0:
				return "http://bj-api.d.jianke.com/";
			case 1:
				return "http://bjtest.jianke.com/";
			case 2:
				return "http://bj-api.jianke.com/";
		}
	}
}