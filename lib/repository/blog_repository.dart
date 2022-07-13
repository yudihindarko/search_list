import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:search_list/config/config_url.dart';
import 'package:search_list/network/network.dart';

class BlogRepository {
  final Network _network = Network.instance;

  Future getBlog() async {
    String url = ConfigUrl.ListUrl;
    try {
      var response = await _network.backOfficeNetwork().get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "error";
      }
    } catch (err) {
      return "error";
    }
  }

  Future getBlogDetail({required String id}) async {
    String url = ConfigUrl.ListUrl + '/' + id;
    try {
      var response = await _network.backOfficeNetwork().get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return "error";
      }
    } catch (err) {
      return "error";
    }
  }
}
