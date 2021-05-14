import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

/*
 * @Description dio请求封装工具库
 * @Author chenjun
 * @Date 2021/5/7
 * @Param
 * @Return
 */
class HttpUtil {
  static BaseOptions options = BaseOptions(
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {});
  static Dio dio = Dio(options);

  static Future get({@required String url, Map<String, dynamic> data = const {}, options, cancelToken}) async {
    print('get请求启动! url：$url ,body: $data');
    Response response;

    try {
      response = await dio.get(url, queryParameters: data, cancelToken: cancelToken);
      print('get请求完成! response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response.data;
  }

  static Future post({@required String url, Map<String, dynamic> data = const {}, options, cancelToken}) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;

    try {
      response = await dio.post(url, data: data, cancelToken: cancelToken);
      print('post请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }
}
