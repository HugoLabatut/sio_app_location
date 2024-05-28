import 'package:flutter/material.dart';
import 'consulter.pages.dart';
import 'package:mysql_client/mysql_client.dart';

const radius = 13.0;
const Color cardColor = Color.fromARGB(255, 243, 236, 255);

class ReserverPage extends StatefulWidget {
  const ReserverPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ReserverPage> createState() => _ReserverPageState();
}

class _ReserverPageState extends State<ReserverPage> {
  late String idBien;
  final TextEditingController _dateControllerDebut = TextEditingController();
  final TextEditingController _dateControllerFin = TextEditingController();

  List<Map<String, String>> listeBien = [];

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
      };
      liste.add(data);
    }
    print("Ici !");

    setState(() {
      listeBien = liste;
    });

    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Réserver",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            const Text("Choissisez vos dates de réservations",
                textAlign: TextAlign.center),
            const Padding(padding: EdgeInsets.all(5.0)),
            TextField(
                controller: _dateControllerDebut,
                decoration: const InputDecoration(
                    labelText: 'Date de début',
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    )),
                readOnly: true,
                onTap: () {
                  _selectDateDebut();
                }),
            const Padding(padding: EdgeInsets.all(5.0)),
            TextField(
                controller: _dateControllerFin,
                decoration: const InputDecoration(
                    labelText: 'Date de fin',
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    )),
                readOnly: true,
                onTap: () {
                  _selectDateFin();
                }),
            const Padding(padding: EdgeInsets.all(30.0)),
            Row(
              children: [
                ElevatedButton(
                  child: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                ElevatedButton(
                    child: const Text("Confirmer"),
                    onPressed: () {
                      _reserverDates();
                    })
              ],
            )
          ],
        ));
  }

  Future<void> _selectDateDebut() async {
    DateTime? _pickedDebut = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_pickedDebut != null) {
      setState(() {
        _dateControllerDebut.text = _pickedDebut.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectDateFin() async {
    DateTime? _pickedFin = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_pickedFin != null) {
      setState(() {
        _dateControllerFin.text = _pickedFin.toString().split(" ")[0];
      });
    }
  }

  Future<void> _reserverDates() async {
    var dDeb = _dateControllerDebut.text;
    var dFin = _dateControllerFin.text;

    print("$dDeb");
    print("$dFin");

    print("Connexion au serveur...");

    final conn = await MySQLConnection.createConnection(
        host: "127.0.0.1",
        port: 3306,
        userName: "root",
        password: "1234",
        databaseName: "projet-locations");
    await conn.connect();
    print("Connecté !");

    var result = await conn
        .execute("INSERT INTO reservation (start, end) VALUES (:dDeb, :dFin)", {
      "dDeb": dDeb,
      "dFin": dFin,
    });
    print("Ici !");

    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Dates insérées"),
              content: const SingleChildScrollView(
                  child: ListBody(
                children: <Widget>[
                  Text("Les dates ont été insérées"),
                  Text("Merci d'avoir fait appel à nos services.")
                ],
              )),
              actions: <Widget>[
                TextButton(
                  child: const Text("Fermer"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });

    await conn.close();
  }
}
