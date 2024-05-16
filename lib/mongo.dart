import 'package:mongo_dart/mongo_dart.dart';

void main() async {
  final db = Db('mongodb://localhost:27017/test');
  await db.open();
  print('Connected to database');
  await db.close();
}