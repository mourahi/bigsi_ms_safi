// ignore_for_file: avoid_print

import 'package:bigsi_ms_safi/component/groupsphone/groupsphonelist.dart';
import 'package:flutter/material.dart';

class GroupsPhoneComponent extends StatelessWidget {
  const GroupsPhoneComponent({Key? key}) : super(key: key);
  static int n = 0;
  @override
  Widget build(BuildContext context) {
    print("GroupsPhoneComponent n=${n++}");
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(),
          body: const GroupsPhoneList(),
        ));
  }
}
