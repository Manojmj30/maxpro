
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmaxpro/todo_controller.dart';


class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
final TodoController controller = Get.put(TodoController());
final TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(
                  height:70,
                  width: 250,
                  child: TextFormField(
                    controller: textcontroller,
                    decoration: const InputDecoration(
                      labelText: 'Add Task',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                const SizedBox(width:10),
                Container(
                
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                     if(textcontroller.text.isNotEmpty){
                       controller.addTask(textcontroller.text);
                       textcontroller.clear();
                     }
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(()=>ListView.builder(
              itemCount: controller.tasks.length,
                itemBuilder:(context, index)
                {
                final task = controller.tasks[index];
                return  Padding(
                  padding: const EdgeInsets.fromLTRB(10,30,10,5),
                  child: ListTile(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    leading: Checkbox(
                        value: task['isCompleted'],
                      activeColor: task['isCompleted']
                          ? Colors.green
                          : Colors.blue, 
                        onChanged: (_)=>controller.toggleTaskCompletion(index),

                    ),
                    title: Text(task['title'],style: const TextStyle(
                      color: Colors.black
                    ),),
                   trailing:  IconButton(
                     icon:const Icon(Icons.delete),
                     onPressed: ()=> controller.deleteCompletedTasks(),
                   ),
                  ),
                );

                },),
          ),
          )],
      ),
    );
  }
}
