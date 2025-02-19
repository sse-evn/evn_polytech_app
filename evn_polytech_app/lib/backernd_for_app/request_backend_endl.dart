// import 'dart:convert';
// import 'package:shelf/shelf.dart';
// import 'package:shelf/shelf_io.dart' as io;
// import 'package:postgres/postgres.dart';

// void main() async {
//   final connection = PostgreSQLConnection(
//     'localhost', // Хост базы данных
//     5432, // Порт
//     'evn_polytech_db', // Название базы
//     username: 'user',
//     password: 'password',
//   );

//   await connection.open();
//   print('Connected to PostgreSQL');

//   final handler = Pipeline()
//       .addMiddleware(logRequests())
//       .addHandler((Request request) async {
//     if (request.url.path == 'login') {
//       final payload = jsonDecode(await request.readAsString());
//       final username = payload['username'];
//       final password = payload['password'];

//       final result = await connection.query(
//         'SELECT id FROM users WHERE username = @username AND password = @password',
//         substitutionValues: {'username': username, 'password': password},
//       );

//       if (result.isNotEmpty) {
//         return Response.ok(jsonEncode({'message': 'Login successful'}),
//             headers: {'Content-Type': 'application/json'});
//       } else {
//         return Response.forbidden(jsonEncode({'error': 'Invalid credentials'}),
//             headers: {'Content-Type': 'application/json'});
//       }
//     }
//     return Response.notFound('Not Found');
//   });

//   final server = await io.serve(handler, 'localhost', 8080);
//   print('Server running on http://${server.address.host}:${server.port}');
// }
