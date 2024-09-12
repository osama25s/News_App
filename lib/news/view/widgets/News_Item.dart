import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/news/data/models/article.dart';
import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/news/News_Details.dart';
import 'package:news_app/shared/Loading_Indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.article, {super.key});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            NewsDetails.routename,
            arguments: article,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ??
                    'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                placeholder: (context, _) => const LoadinIndicator(),
                errorWidget: (_, __, ___) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 64,
                ),
                width: double.infinity,
                height: 230.h,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              article.source?.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 12.sp, color: Colors.grey),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              article.title ?? '',
              maxLines: 2,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                timeago.format(article.publishedAt ?? DateTime.now()),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 12.sp, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
