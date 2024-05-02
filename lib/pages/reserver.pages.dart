import 'package:flutter/material.dart';

class ReserverPages extends StatefulWidget {
  const ReserverPages({super.key});

  @override
  State<ReserverPages> createState() => _ReserverPagesState();
}

class _ReserverPagesState extends State<ReserverPages> {
  final TextEditingController _dateControllerDebut = TextEditingController();
  final TextEditingController _dateControllerFin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 245, 253),
          title: const Text('Réserver',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
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
                              _alertBoxProto();
                            })
                      ],
                    )
                  ],
                ))));
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

  Future<void> _alertBoxProto() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Test AlertDialog"),
              content: const SingleChildScrollView(
                  child: ListBody(
                children: <Widget>[
                  Text("Test du widget AlertDialog"),
                  Text("Hello world!")
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
  }
}
