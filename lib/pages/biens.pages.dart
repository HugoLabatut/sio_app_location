import 'package:flutter/material.dart';
import 'consulter.pages.dart';
import 'consulter2.pages.dart';
import 'consulter3.pages.dart';
import 'consulter4.pages.dart';
import 'package:mysql_client/mysql_client.dart';
import '../pdo/pdo.dart';

const radius = 20.0;
const Color cardColor = Color.fromARGB(255, 243, 236, 255);

class BiensPages extends StatefulWidget {
  const BiensPages({super.key});

  @override
  State<BiensPages> createState() => _BiensPagesState();
}

class _BiensPagesState extends State<BiensPages> {
  int currentPageIndex = 0;
  @override
  Future<void> _getLabelsFromMySQL() async {
    try {
      MySQLConnection conn = await createConnection();
      await conn.connect();
      List<List<dynamic>> results = await conn.execute("SELECT * FROM typebien");
      for (final row in results.rows) {
        List <String> labels = results.map((row) => row['lib_type_bien'] as String).toList();
      }
      await conn.close;
    } catch (e) {
      AssertionError("Erreur de connexion à la base de données : $e");
    }
  }

  void initState() {
    super.initState();
    _getLabelsFromMySQL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 245, 253),
        title: const Text('Tous les biens',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      ),
      bottomNavigationBar: NavigationBar(
        shadowColor: Colors.deepPurple,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: labels[index]),
          NavigationDestination(icon: Icon(Icons.house), label: 'Maisons'),
          NavigationDestination(icon: Icon(Icons.chalet), label: 'Châlets'),
          NavigationDestination(
icon: Icon(Icons.apartment), label: 'Appartements')
        ],
      ),
      body: <Widget>[
        // Tous les biens
        SingleChildScrollView(
          child: Column(children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConsulterPages()));
              },
              child: Card(
                  color: cardColor,
                  child: Column(children: [
                    const Text("Maison n°1",
                        style: TextStyle(color: Colors.black, fontSize: 26)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const Image(
                            image: NetworkImage(
                                "https://cdn.mos.cms.futurecdn.net/LhGUFiZ3y8QRxbkHztmVge-1200-80.jpg"))),
                  ])),
            ),
            const Padding(padding: EdgeInsets.all(1.0)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConsulterDeuxPages()));
              },
              child: Card(
                  color: cardColor,
                  child: Column(children: [
                    const Text("Maison n°2",
                        style: TextStyle(color: Colors.black, fontSize: 26)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const Image(
                            image: NetworkImage(
                                "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"))),
                  ])),
            ),
            const Padding(padding: EdgeInsets.all(1.0)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConsulterTroisPages()));
              },
              child: Card(
                  color: cardColor,
                  child: Column(children: [
                    const Text("Appartement n°1",
                        style: TextStyle(color: Colors.black, fontSize: 26)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const Image(
                            image: NetworkImage(
                                "https://static.planetminecraft.com/files/image/minecraft/project/2022/040/15609268-aecba-fc-be-aadde_xl.webp"))),
                  ])),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConsulterQuatrePages()));
                },
                child: Card(
                    color: cardColor,
                    child: Column(children: [
                      const Text("Châlet n°1",
                          style: TextStyle(color: Colors.black, fontSize: 26)),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: const Image(
                              image: NetworkImage(
                                  "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"))),
                    ]))),
          ]),
        ),
        // Les maisons
        SingleChildScrollView(
          child: Column(children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConsulterPages()));
              },
              child: Card(
                  color: cardColor,
                  child: Column(children: [
                    const Text("Maison n°1",
                        style: TextStyle(color: Colors.black, fontSize: 26)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const Image(
                            image: NetworkImage(
                                "https://cdn.mos.cms.futurecdn.net/LhGUFiZ3y8QRxbkHztmVge-1200-80.jpg"))),
                  ])),
            ),
            const Padding(padding: EdgeInsets.all(1.0)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConsulterDeuxPages()));
              },
              child: Card(
                  color: cardColor,
                  child: Column(children: [
                    const Text("Maison n°2",
                        style: TextStyle(color: Colors.black, fontSize: 26)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const Image(
                            image: NetworkImage(
                                "https://staticg.sportskeeda.com/editor/2022/04/52730-16501588848206-1920.jpg"))),
                  ])),
            ),
          ]),
        ),
        // Les châlets
        SingleChildScrollView(
          child: Column(children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConsulterQuatrePages()));
                },
                child: Card(
                    color: cardColor,
                    child: Column(children: [
                      const Text("Châlet n°1",
                          style: TextStyle(color: Colors.black, fontSize: 26)),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: const Image(
                              image: NetworkImage(
                                  "https://static.planetminecraft.com/files/resource_media/screenshot/1821/2018-05-27-09-21-10-1527405844_lrg.png"))),
                    ]))),
          ]),
        ),
        // Les appartements
        SingleChildScrollView(
          child: Column(children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConsulterTroisPages()));
              },
              child: Card(
                  color: cardColor,
                  child: Column(children: [
                    const Text("Appartement n°1",
                        style: TextStyle(color: Colors.black, fontSize: 26)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const Image(
                            image: NetworkImage(
                                "https://static.planetminecraft.com/files/image/minecraft/project/2022/040/15609268-aecba-fc-be-aadde_xl.webp"))),
                  ])),
            ),
          ]),
        ),
      ][currentPageIndex],
    );
  }
}
