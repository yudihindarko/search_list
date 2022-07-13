import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_list/model/blog_model.dart';
import 'package:search_list/page/blog.dart';
import 'package:search_list/page/home.dart';
import 'package:search_list/router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App() {
    final router = FluroRouter.appRouter;
    Routes.configureRoutes(router);
    Application.router = router;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BlogModel>(
          create: (context) => BlogModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Search List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
