import 'package:flutter/material.dart';
import 'package:search_list/model/blog.dart';
import 'package:search_list/repository/blog_repository.dart';

class BlogViewState {
  bool isProgress = true;
  bool isUpdate = false;
  bool isError = false;
}

class BlogModel extends ChangeNotifier {
  BlogRepository blogRepository = BlogRepository();
  BlogViewState viewState = BlogViewState();
  Blog? blog;
  BlogList? blogLists;
  List<Blog> listBlog = [];

  getBlog() async {
    await blogRepository.getBlog().then((value) {
      if (value != "error") {
        blogLists = BlogList.fromJson({"blog_list": value});
        listBlog = blogLists!.blogList!;
        return onSuccess();
      } else {
        return onError();
      }
    });
  }

  getBlogDetails(String id) async {
    await blogRepository.getBlogDetail(id: id).then((value) {
      if (value != "error") {
        blog = Blog.fromJson(value);
        return onSuccess();
      } else {
        return onError();
      }
    });
  }

  runFilter(String enteredKeyword) {
    List<Blog> results = [];
    if (enteredKeyword.isNotEmpty) {
      results = blogLists!.blogList!.where((element) {
        return element.title!.contains(enteredKeyword.toLowerCase());
      }).toList();
      // we use the toLowerCase() method to make it case-insensitive
    } else {
      results = blogLists!.blogList!;
    }
    listBlog = results;
    notifyListeners();
  }

  bool onError() {
    viewState.isProgress = false;
    viewState.isUpdate = false;
    viewState.isError = true;
    notifyListeners();
    return false;
  }

  bool onSuccess() {
    viewState.isProgress = false;
    viewState.isUpdate = false;
    viewState.isError = false;
    notifyListeners();
    return true;
  }
}
