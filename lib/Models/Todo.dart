class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Make Flutter App', isDone: false),
      // ToDo(id: '02', todoText: 'Make App', isDone: true),
      // ToDo(id: '03', todoText: 'Play Game'),
    ];
  }
  }

