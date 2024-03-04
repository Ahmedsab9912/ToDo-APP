import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/HomePage/todoitem.dart';
import 'package:todoapp/Models/Todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[50],
        drawer: Drawer(),
        appBar: AppBar(
          title: Text(
            'ToDo-List',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    searchBox(),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50, bottom: 20),
                            child: Text(
                              'My ToDos',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                          ),
                          for (ToDo todo in _foundToDo)
                            ToDoItem(
                              todo: todo,
                              onToDoChange: _handleToDoChange,
                              onDeleteItem: _deleteTodoItem,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),
                        ], // Wrap BoxShadow in a list
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size(30, 10),
                          elevation: 10),
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      onPressed: () {
                        _addtoDoItem(_todoController.text);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  //MAKING FUNCTION FOR TODOLIST
  void _handleToDoChange(ToDo todo) {
    setState(() {});
    todo.isDone = !todo.isDone;
  }

  // FUNCTION FOR DELETING
  void _deleteTodoItem(String id) {
    setState(() {});
    todoList.removeWhere((item) => item.id == id);
  }

  //FUNCTION TO ADD TODOO
  void _addtoDoItem(String todo) {
    setState(() {});
    todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: todo
    ));
    _todoController.clear();
  }

  //FILTER FUNCTION

  void _runFilter(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todoList;
    }else{
      results = todoList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  // THIS IS MY SEARCHBOX
  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged:(value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.red,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 40),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
