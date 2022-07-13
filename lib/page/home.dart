import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_list/model/blog_model.dart';
import 'package:search_list/page/blog.dart';
import 'package:search_list/router.dart';
import 'package:search_list/utils.dart';
import 'package:skeletons/skeletons.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<BlogModel>(context, listen: false).getBlog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
      ),
      body: Consumer<BlogModel>(
        builder: (context, blogModel, child) {
          if (blogModel.viewState.isProgress) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: SkeletonListView(),
            );
          }

          if (blogModel.viewState.isError) {
            return Container(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text("Blog Not Found!!"),
                ));
          }

          return Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 80),
              child: ListView.builder(
                itemCount: blogModel.listBlog.length,
                itemBuilder: (BuildContext context, index) {
                  var blog = blogModel.listBlog[index];
                  return GestureDetector(
                    onTap: () {
                      Application.router
                          .navigateTo(context, "/blog/${blog.id.toString()}");
                    },
                    child: Container(
                      color: index % 2 == 0
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : const Color.fromARGB(94, 231, 231, 231),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(blog.title!.toTitleCase(),
                              style: TextStyleTitle()),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            blog.body!.replaceAll("\n", " "),
                            style: TextStyleBody(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                onChanged: (value) => blogModel.runFilter(value),
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
