import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(this.article, {Key? key}) : super(key: key);

  final dynamic article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(article['url']),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder:
                      const AssetImage('assets/images/placeholder.jpg'),
                  image: article['urlToImage'] != null
                      ? NetworkImage(article['urlToImage'])
                      : const AssetImage('assets/images/placeholder.jpg')
                          as ImageProvider,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd – kk:mm')
                          .format(DateTime.parse(article['publishedAt'])),
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
