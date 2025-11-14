import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:github_blog/repository/post_repository.dart';

import '../models/menu_model.dart';
import '../models/post_model.dart';

final postRepositoryProvider = Provider((ref) => PostRepository());

final menusProvider = FutureProvider<List<MenuModel>>((ref) async {
  final repo = ref.watch(postRepositoryProvider);
  return repo.getMenus();
});

final postsProvider = FutureProvider<List<PostModel>>((ref) async {
  final repo = ref.watch(postRepositoryProvider);
  return repo.getPosts();
});

final selectedMenuProvider = StateProvider<String?>((ref) => null);

final filteredPostsProvider = FutureProvider<List<PostModel>>((ref) async {
  final posts = await ref.watch(postsProvider.future);
  final selectedMenu = ref.watch(selectedMenuProvider);

  if(selectedMenu == null) {
    return posts;
  }

  return posts.where((post) =>
    post.menuId == selectedMenu).toList();
});