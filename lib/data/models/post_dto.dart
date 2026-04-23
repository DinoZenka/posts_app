import 'package:json_annotation/json_annotation.dart';
import 'package:posts_app/domain/entities/post.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class PostDto {
  final int id;
  final String title;
  final String body;
  final int userId;

  const PostDto({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);

  Post toEntity() {
    return Post(id: id, title: title, body: body, userId: userId);
  }
}
