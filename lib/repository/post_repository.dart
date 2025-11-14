import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/menu_model.dart';
import '../models/post_model.dart';

class PostRepository {
  Future<List<MenuModel>> getMenus() async {
    try {
      final jsonString = await rootBundle.loadString('assets/menu.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((json) => MenuModel(
                id: json['id'],
                name: json['name'],
                createdAt: DateTime.parse(json['createdAt']),
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to load menus: $e');
    }
  }

  Future<List<PostModel>> getPosts() async {}
}
