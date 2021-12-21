import 'package:bigsi_ms_safi/component/groupsphone/groupsphone.dart';
import 'package:bigsi_ms_safi/component/groupsphone/groupsphoneprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupsPhoneList extends StatelessWidget {
  const GroupsPhoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupsPhoneProvider>(builder: (context, value, _) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: value.groupsPhoneList.length,
          itemBuilder: (BuildContext ctx, int i) {
            return Container(
              color: Colors.red,
              margin: const EdgeInsets.all(8.0),
              child: _newsItem(ctx, i, value.groupsPhoneList[i]),
            );
          });
    });
  }

  Widget _newsItem(BuildContext context, int i, GroupsPhone ns) {
    return Card(
        child: ListTile(
      title: Text("${ns.nom} $i"),
      leading: const Icon(Icons.ac_unit),
      onTap: () {
        Navigator.of(context).pushNamed('phonescomponent', arguments: ns);
      },
    ));
  }
}
