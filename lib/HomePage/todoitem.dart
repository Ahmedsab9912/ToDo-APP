import 'package:flutter/material.dart';

import '../Models/Todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;

  const ToDoItem({Key? key,
    required this.onToDoChange,
    required this.onDeleteItem,
    required this.todo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
      onTap: () {
       onToDoChange(todo);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      tileColor: Colors.white,
      leading: Icon(
        todo.isDone ? Icons.check_box : Icons.check_box_outline_blank_outlined,
        color: Colors.red,
      ),
      title: Text(
        todo.todoText!,
        style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ?  TextDecoration.lineThrough : null),
      ),
          trailing: IconButton(
            color: Colors.white,
            iconSize: 24,
            onPressed: (){
              onDeleteItem(todo.id);
            }, icon: Icon(Icons.delete,color: Colors.red,),
          )
    ));
  }
}
