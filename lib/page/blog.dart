import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_list/model/blog_model.dart';
import 'package:search_list/utils.dart';
import 'package:skeletons/skeletons.dart';

class BlogPage extends StatefulWidget {
  static const String route = '/blog';
  String id;

  BlogPage(this.id);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    Provider.of<BlogModel>(context, listen: false).viewState.isProgress = true;
    Provider.of<BlogModel>(context, listen: false).getBlogDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Blog Details"),
        ),
        body: Consumer<BlogModel>(builder: (context, blogModel, child) {
          if(blogModel.blog == null){
            return Container();
          }
          if (blogModel.viewState.isProgress) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: SkeletonParagraph(),
            );
          }

          if (blogModel.viewState.isError) {
            return Container(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text("Blog Not Found!!"),
                ));
          }

          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    blogModel.blog!.title!.toTitleCase(),
                    style: TextStyleTitle(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    blogModel.blog!.body!.replaceAll("\n", " "),
                    style: TextStyleBody(),
                  )
                ]),
          );
        }));
  }
}
