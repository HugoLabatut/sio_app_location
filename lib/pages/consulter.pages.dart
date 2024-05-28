import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'reserver.pages.dart';

const radius = 13.0;
const Color cardColor = Color.fromARGB(255, 243, 236, 255);

class ConsulterPage extends StatefulWidget {
  const ConsulterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ConsulterPage> createState() => _ConsulterPageState();
}

class _ConsulterPageState extends State<ConsulterPage> {
  late String idBien;

  List<Map<String, String>> affichageListeBien = [];
  List<Map<String, String>> affichagePhotosBien = [];

  Future<void> _getBiensByID() async {
    print("Connexion au serveur...");
    final conn = await MySQLConnection.createConnection(
        host: "127.0.0.1",
        port: 3306,
        userName: "root",
        password: "1234",
        databaseName: "projet-locations");
    await conn.connect();
    print("Connecté !");
    var result =
        await conn.execute("SELECT * FROM bien WHERE id_bien = $idBien");
    List<Map<String, String>> liste = [];
    for (final row in result.rows) {
      final data = {
        'selectedIdBien': row.colAt(0)!,
        'selectedNomBien': row.colAt(1)!,
        'selectedAdresseBien': row.colAt(2)!,
        'selectedCPBien': row.colAt(3)!,
        'selectedDescBien': row.colAt(7)!
      };
      liste.add(data);
    }
    print("Ici !");

    setState(() {
      affichageListeBien = liste;
    });

    await conn.close();
  }

  Future<void> _getPhotosByBien() async {
    print("Connexion au serveur...");
    final conn = await MySQLConnection.createConnection(
        host: "127.0.0.1",
        port: 3306,
        userName: "root",
        password: "1234",
        databaseName: "projet-locations");
    await conn.connect();
    print("Connecté !");
    var result =
        await conn.execute("SELECT * FROM photo WHERE id_bien = $idBien");
    List<Map<String, String>> liste = [];
    for (final row in result.rows) {
      final dataPhotos = {
        'selectedLienPhoto': row.colAt(2)!,
      };
      liste.add(dataPhotos);
    }
    print("Ici !");

    setState(() {
      affichagePhotosBien = liste;
    });

    await conn.close();
  }

  @override
  void initState() {
    super.initState();
    idBien = widget.title;
    _getBiensByID();
    _getPhotosByBien();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Consulter un bien",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        ...affichageListeBien.map<Widget>((data) {
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(data['selectedNomBien'] ?? "",
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(data['selectedDescBien'] ?? "",
                    style: const TextStyle(fontSize: 20)),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Adresse du bien : "),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(data['selectedAdresseBien'] ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Code postal : "),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(data['selectedCPBien'] ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              ElevatedButton(onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ReserverPage(
                              title: data['selectedIdBien'] ?? ""))));
              }, child: const Text("Réserver"))
            ],
          );
        }).toList(),
        ...affichagePhotosBien.map<Widget>((dataPhotos) {
          return Column(
            children: [
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Image.network(dataPhotos['selectedLienPhoto'] ?? ""),
              )
            ],
          );
        }).toList(),
      ])),
    );
  }
}
