import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
var todo =TextEditingController();
  List todos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.max,  
                children: [
                  Image.network(
                      'https://i.pinimg.com/originals/31/36/cd/3136cd447c99783f59cd1a4c7d9ca9c1.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                   child :TextField(
                      controller: todo,
                      decoration: const InputDecoration(hintText: 'Type'),
                    ),
                   ),
                  const SizedBox(
                    height: 30,
                  ),
           
                  ElevatedButton(
                      onPressed: () {
                        if (todo.text.isNotEmpty) {
                          setState(() {
                          todos.add(todo.text);
                            todo.clear();   
                          });
                           
                        }
                      },

                      child: const Text('Submit')),
                             const SizedBox(
                    height: 150,
                  ),
                  Text(todos.length.toString()),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                        dense: true,
                        title: Text(todos[index]),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                todos.removeWhere(
                                    (element) => element == todos[index]);
                              });
                            },
                            icon: const Icon(Icons.clear)),
                      );
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
