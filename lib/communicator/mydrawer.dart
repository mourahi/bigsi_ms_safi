import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  static int i = 0;

  @override
  Widget build(BuildContext context) {
    i += i;
    return Drawer(
      child: Center(child: Text('nombre creation = $i')),
    );
  }
}
