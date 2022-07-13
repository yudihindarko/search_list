import 'package:dio/dio.dart';
import 'package:search_list/network/backoffice_interceptor.dart';

class Network {
  Network._privateConstructor();

  static final Network instance = Network._privateConstructor();

  static Dio? _network;

  Dio backOfficeNetwork() {
    if (_network != null) return _network!;
    _network = _initBackOfficeNetwork();
    return _network!;
  }

  _initBackOfficeNetwork() {
    final BaseOptions baseOptions = BaseOptions(
        connectTimeout: 60000,
        receiveTimeout: 60000,
        sendTimeout: 60000,
        followRedirects: true);
    final Dio dio = Dio(baseOptions);
    // dio.interceptors.add(LogInterceptor(
    //     requestHeader: true,
    //     responseHeader: true,
    //     responseBody: true,
    //     requestBody: true));
    dio.interceptors.add(NetworkInterceptor(dio));
    return dio;
  }
}
