import 'package:flutter/material.dart';
import 'reserver.pages.dart';

const radius = 13.0;
const Color cardColor = Color.fromARGB(255, 243, 236, 255);

class ConsulterQuatrePages extends StatefulWidget {
  const ConsulterQuatrePages({super.key});

  @override
  State<ConsulterQuatrePages> createState() => _ConsulterQuatrePagesState();
}

class _ConsulterQuatrePagesState extends State<ConsulterQuatrePages> {
  final List<Image> lesImages = [
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 245, 253),
        title: const Text('Consulter un bien',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: <Widget>[
          Card(
              color: cardColor,
              child: Row(children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: const Image(
                      image: NetworkImage(
                          "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"),
                      height: 100.0,
                    )),
                const Column(
                  children: <Widget>[
                    Text("Châlet n°1",
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    Text("Route du puy",
                        textAlign: TextAlign.left),
                    Text("63240 Mont-Dore", textAlign: TextAlign.left)
                  ],
                )
              ])),
          const Padding(padding: EdgeInsets.all(1.0)),
          const Card(
            child: Text("Ceci est un descriptif du bien.", textAlign: TextAlign.left)
          ),
          const Padding(padding: EdgeInsets.all(1.0)),
          Expanded(
              child:
                  GridView.count(crossAxisCount: 3, children: [...lesImages])),
          Row(children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            const Padding(padding: EdgeInsets.all(5.0)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReserverPages()));
                },
                child: const Text("Réserver"))
          ])
        ],
      ),
    );
  }
}
