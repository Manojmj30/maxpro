import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class  TodoController extends GetxController{
  var tasks = <Map<String,dynamic>>[].obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
   loadTasks();
  }
  void loadTasks(){
    List<dynamic>? storedTasks = storage.read<List>('tasks');
    if(storedTasks!=null){
      tasks.assignAll(storedTasks.map((task)=>task as Map<String,dynamic>).toList());
    }
  }
  void saveTasks(){
    storage.write('tasks',tasks);
  }
  void addTask(String title){
    tasks.add(
      {
        'title':title,
        'isCompleted':false
      }
    );
    storage.write('tasks', tasks);
    saveTasks();
  }
  void toggleTaskCompletion(int index){
    tasks[index]['isCompleted']=!tasks[index]['isCompleted'];
    tasks.refresh();
    storage.write('tasks',tasks);
    saveTasks();
  }
  void deleteCompletedTasks(){
    tasks.removeWhere((task)=>task['isCompleted']);
    storage.write('tasks', tasks);
    saveTasks();
  }
}