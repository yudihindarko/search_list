import 'package:dio/dio.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  Dio dio;

  // ConfigUrl config;

  NetworkInterceptor(this.dio);

  @override
  Future onRequest(RequestOptions options,
      RequestInterceptorHandler requestInterceptorHandler) async {
    requestInterceptorHandler.next(options);
    // return options;
  }

  @override
  void onResponse(Response response,
      ResponseInterceptorHandler responseInterceptorHandler) {
    responseInterceptorHandler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler errorInterceptorHandler) {
    errorInterceptorHandler.resolve(err.response!);
  }
}
