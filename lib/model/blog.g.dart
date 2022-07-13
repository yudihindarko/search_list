// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogList _$BlogListFromJson(Map<String, dynamic> json) => BlogList(
      blogList: (json['blog_list'] as List<dynamic>?)
          ?.map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogListToJson(BlogList instance) => <String, dynamic>{
      'blog_list': instance.blogList,
    };

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
