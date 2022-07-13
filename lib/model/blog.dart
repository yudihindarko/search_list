import 'package:json_annotation/json_annotation.dart';

part 'blog.g.dart';

@JsonSerializable()
class BlogList {
  @JsonKey(name: 'blog_list')
  List<Blog>? blogList;

  BlogList({this.blogList});

  factory BlogList.fromJson(Map<String, dynamic> json) =>
      _$BlogListFromJson(json);

  Map<String, dynamic> toJson() => _$BlogListToJson(this);
}

@JsonSerializable()
class Blog {
  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'body')
  String? body;

  Blog({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
}
