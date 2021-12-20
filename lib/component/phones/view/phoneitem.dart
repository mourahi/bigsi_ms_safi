import 'package:bigsi_ms_safi/component/phones/provider/phone.dart';
import 'package:bigsi_ms_safi/component/phones/provider/phonesprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneItem extends StatelessWidget {
  final int i;
  final Phone phone;

  const PhoneItem({Key? key, required this.i, required this.phone})
      : super(key: key);

  static int n = 0;

  @override
  Widget build(BuildContext context) {
    //print("ItemPhone appel n:${n++}");
    var prov = Provider.of<PhonesProvider>(context, listen: false);
    return Card(
        elevation: 1,
        child: ListTile(
          title: Text("${phone.nom} $i"),
          subtitle: Text("${phone.ecole} $i"),
          leading: const Icon(Icons.phone),
          trailing: IconButton(
              onPressed: () {},
              icon: IconButton(
                  onPressed: () {
                    phone.fav = !phone.fav;
                    prov.setfavoris(phone);
                  },
                  icon: phone.fav
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_outline))),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      const Icon(Icons.phone),
                      const Icon(Icons.sms),
                      const Icon(Icons.share),
                      Text(
                        "ecole $i",
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(phone.ecole.toString()),
                      Text(phone.nom.toString()),
                      const Text("annexe"),
                      const Text("lien vers map"),
                    ],
                  );
                });
          },
        ));
  }
}
