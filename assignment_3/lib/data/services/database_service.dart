// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/post_model.dart';

class DatabaseService {
  static Database? _database;

  // Initialize database
  static Future<Database> initDB() async {
    final String path = join(await getDatabasesPath(), 'posts.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE posts(id INTEGER PRIMARY KEY, title TEXT, body TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  // Insert posts into the database
  static Future<void> insertPosts(List<Post> posts) async {
    final db = await database;
    for (var post in posts) {
      await db.insert(
        'posts',
        post.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Retrieve all posts from the database
  static Future<List<Post>> getPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('posts');
    return List.generate(maps.length, (i) => Post.fromJson(maps[i]));
  }
}
