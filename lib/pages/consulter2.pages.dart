import 'package:flutter/material.dart';
import 'reserver.pages.dart';

const radius = 13.0;
const Color cardColor = Color.fromARGB(255, 243, 236, 255);

class ConsulterDeuxPages extends StatefulWidget {
  const ConsulterDeuxPages({super.key});

  @override
  State<ConsulterDeuxPages> createState() => _ConsulterDeuxPagesState();
}

class _ConsulterDeuxPagesState extends State<ConsulterDeuxPages> {
  final List<Image> lesImages = [
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
        fit: BoxFit.cover,
        height: 30.0,
        width: 30.0),
    const Image(
        image: NetworkImage(
            "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
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
                          "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"),
                      height: 100.0,
                    )),
                const Column(
                  children: <Widget>[
                    Text("Maison n°2",
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    Text("Lieu-dit LACOSTE SUD", textAlign: TextAlign.left),
                    Text("24290 Montignac-Lascaux", textAlign: TextAlign.left)
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
