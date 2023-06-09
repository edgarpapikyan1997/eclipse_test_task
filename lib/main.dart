import 'package:eds_test/presentation/main_page.dart';
import 'package:flutter/material.dart';

import 'constants/flavor.dart';
import 'providers/get_it.dart';

Future<void> main() async {
  await run();
}

Future<void> run({Flavor env = Flavor.DEV}) async {
  WidgetsFlutterBinding.ensureInitialized();
  registerGetIt(env);
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Task Application',
      home: MainPage(),
    );
  }
}
