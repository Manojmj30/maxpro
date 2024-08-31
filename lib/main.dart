import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projectmaxpro/todo_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TODO List',
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}


