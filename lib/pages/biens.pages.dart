import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

const radius = 20.0;
const Color cardColor = Color.fromARGB(255, 243, 236, 255);

class BiensPage extends StatefulWidget {
  const BiensPage({super.key});

  @override
  State<BiensPage> createState() => _BiensPageState();
}

class _BiensPageState extends State<BiensPage> {
  List<Map<String, String>> affichageListe = [];

  Future<void> _getBiens() async {
    print("Connexion au serveur...");
    final conn = await MySQLConnection.createConnection(
        host: "127.0.0.1",
        port: 3306,
        userName: "root",
        password: "1234",
        databaseName: "projet-locations");
    await conn.connect();
    print("Connecté !");
    var result = await conn.execute(
        "SELECT * FROM photo INNER JOIN bien ON photo.id_bien = bien.id_bien");
    List<Map<String, String>> liste = [];
    for (final row in result.rows) {
      final data = {
        'selectedIdBien': row.colAt(4)!,
        'selectedLienPhoto': row.colAt(3)!,
      };
      liste.add(data);
    }
    print("Ici !");

    setState(() {
      affichageListe = liste;
    });

    await conn.close();
  }

  @override
  void initState() {
    super.initState();
    _getBiens();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Liste des biens",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: affichageListe.map<Widget>((data) {
            return Card(
                child: ListTile(
                    leading: Image.network(data["selectedLienPhoto"] ?? ""),
                    title: Text(data['selectedIdBien'] ?? "")));
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _getBiens,
        tooltip: 'GetBiens',
        label: const Text("Réactualiser"),
      ),
    );
  }
}
