import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_blog/providers/post_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: _title(),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: _avatar(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.black),
          padding: EdgeInsets.all(80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _postList(ref),
              _menu(ref),
            ],
          ),
        ));
  }

  Widget _title() {
    return Text("ProgrammerLife();");
  }

  Widget _avatar() {
    return CircleAvatar(
      backgroundImage: AssetImage("images/test.png"),
      radius: 16,
    );
  }

  Widget _postList(WidgetRef ref) {
    final filteredPosts = ref.watch(filteredPostsProvider);
    return filteredPosts.when(
      data: (posts) => Column(
        children: [Text("All posts(${posts.length})"),
        SizedBox(height: 16),
          Expanded(child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, i) {
            final post = posts[i];
            return GestureDetector(
              onTap: () {},
              child: Padding(padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(post.title),),
            );
          }))
        ],
      ),
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text("Error: $err")
    );
  }

  Widget _menu(WidgetRef ref) {
    final menus = ref.watch(menusProvider);
    return menus.when(
        data: (menuList) => Column(
      children: [Text("All menu(${menuList.length})"),
        SizedBox(height: 16),
        Expanded(child: ListView.builder(
            itemCount: menuList.length,
            itemBuilder: (context, i){
          final menu = menuList[i];
          return GestureDetector(
            onTap: () {
              ref.read(selectedMenuProvider.notifier).state = menu.id.toString();
            },
            child: Padding(padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(menu.name),
          ));
        }))
      ],
    ),
        loading: () => CircularProgressIndicator(),
    error: (err, stack) => Text("Error: $err"));
  }
}
