import 'package:flutter/material.dart';

class FormationComponent extends StatelessWidget {
  const FormationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Formation"),
          ),
          body: const Center(
            child: Text(
              "Formation",
              style: TextStyle(fontSize: 20),
            ),
          )),
    );
  }
}
