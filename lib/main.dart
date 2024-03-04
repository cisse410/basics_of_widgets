import 'package:flutter/material.dart';
import 'package:johan/navigation/routes/auth_routes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        fontFamily: 'Times New Roman',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AuthRouteManager.main,
      onGenerateRoute: AuthRouteManager.generateRoute,
    );
  }
}
