import 'package:flutter/material.dart';
import 'package:uni_pal/FrontControl/routes.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: routes,
  ));
}



// class unipal extends StatelessWidget {
//   const unipal({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Unipal',
//       home: Home(),
//     );
//   }
// }

// void main() => runApp(const unipal());
