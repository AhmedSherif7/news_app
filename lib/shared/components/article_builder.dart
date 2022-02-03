import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'article_item.dart';
import 'my_divider.dart';

class ArticleBuilder extends StatelessWidget {
  const ArticleBuilder(this.articles, {Key? key, this.isSearch = false})
      : super(key: key);

  final List<dynamic> articles;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: articles.isNotEmpty,
      builder: (context) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => ArticleItem(articles[index]),
          separatorBuilder: (context, index) => const MyDivider(),
          itemCount: articles.length,
        );
      },
      fallback: (context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
