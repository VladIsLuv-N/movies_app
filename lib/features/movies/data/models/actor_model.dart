import 'package:clean_movies_app/features/movies/domain/entities/actor.dart';

class ActorModel {
  final int id;
  final String photo;
  final String name;

  ActorModel({required this.id, required this.photo, required this.name});

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'] as int,
      photo: json['photo'] as String,
      name: json['name'] as String,
    );
  }

  Actor toEntity() {
    return Actor(id: id, photo: photo, name: name);
  }
}
