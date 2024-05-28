import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'consulter.pages.dart';

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
    var result = await conn.execute("SELECT * FROM bien");
    List<Map<String, String>> liste = [];
    for (final row in result.rows) {
      final data = {
        'selectedIdBien': row.colAt(0)!,
        'selectedNomBien': row.colAt(1)!,
        'selectedAdresseBien' : row.colAt(2)!,
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
              // leading: Image.network(data["selectedLienPhoto"] ?? ""),
              title: Text(data['selectedNomBien'] ?? ""),
              subtitle: Text(data['selectedAdresseBien'] ?? ""),
              trailing: TextButton(
                child: const Text("Sélectionner"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ConsulterPage(
                              title: data['selectedIdBien'] ?? ""))));
                },
              ),
            ));
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
