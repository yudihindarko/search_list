import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:search_list/page/blog.dart';
import 'package:search_list/page/home.dart';

class Application {
  static late final FluroRouter router;
}

class Routes {
  static Handler homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return HomePage();
  });
  static Handler blogHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    String? id = params["id"]?.first;
    return BlogPage(id!);
  });


  static void configureRoutes(FluroRouter router) {
    router.define(
      '/',
      handler: homeHandler,
    );
    router.define(
      'blog/:id',
      handler: blogHandler,
      transitionType: TransitionType.inFromRight
    );
    router.notFoundHandler = homeHandler;
  }
}
