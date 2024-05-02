import "package:mysql_client/mysql_client.dart";

Future<MySQLConnection> createConnection() async {
// Remplacez les valeurs ci-dessous par vos propres informations de connexion

  final conn = await MySQLConnection.createConnection(
    host: "127.0.0.1",
    port: 3306,
    userName: "root",
    password: "1234",
    databaseName: "projet-locations",
  );

  return conn;
}
