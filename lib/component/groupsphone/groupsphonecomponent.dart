import 'package:bigsi_ms_safi/component/groupsphone/groupsphonelist.dart';
import 'package:flutter/material.dart';

class GroupsPhoneComponent extends StatelessWidget {
  const GroupsPhoneComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(),
          body: const GroupsPhoneList(),
        ));
  }
}
