import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/menu_model.dart';
import '../models/post_model.dart';

class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MenuModel>> getMenus() async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('menus').get();
      return snapshot.docs
          .map((doc) => MenuModel(
                id: doc['id'],
                name: doc['name'],
                createdAt: (doc['createdAt'] as Timestamp).toDate(),
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to load menus: $e');
    }
  }

  Future<List<PostModel>> getPosts() async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('posts').get();
      return snapshot.docs
              .map((d) => PostModel(
            id: d['id'],
            title: d['title'],
            content: d['content'],
            menuId: d['menuId'].toString(),
            isPublished: d['isPublished'],
            createdAt: (d['createdAt'] as Timestamp).toDate(),
            updatedAt: (d['updatedAt'] as Timestamp).toDate(),
          )).toList();
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }
}
