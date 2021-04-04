import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String description;
  bool isCompleted;
  Todo({this.description})
      : this.id = Uuid().v1(),
        this.isCompleted = false;
}
