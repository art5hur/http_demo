import 'dart:convert';

import 'package:http/http.dart' as http;
void main(List<String> arguments) async{
 final body = await getTodo(4);
 if (body!= null){
  print (body.title);
 }
}

Future<Todo?> getTodo(int id) async {
 final url = Uri.parse("https://jsonplaceholder.typicode.com/todos/$id");
  final response = await http.get(url);
  
  if (response.statusCode == 200){
    final Map map = jsonDecode(response.body);
    return Todo(
      id: map['id'], 
      userId: map['userId'], 
      title: map['title'], 
      completed: map['completed']
      );
  }
  return null;
}

  class Todo {
    final int id;
    final int userId;
    final String title;
    final bool completed;

  Todo({required this.id, required this.userId, required this.title, required this.completed}); 
  }