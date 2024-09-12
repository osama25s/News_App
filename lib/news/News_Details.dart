import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/shared/Loading_Indicator.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_app/news/data/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routename = 'newsDetails';
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)!.settings.arguments as Article;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News Title'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              margin: const EdgeInsets.only(right: 10, left: 10, top: 25),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Column(
                children: [
                  Text(
                    '${article.description}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppTheme.black, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _launchUrl(article.url ?? '');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.transparent),
                      elevation: WidgetStateProperty.all<double>(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'View Full Article',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: AppTheme.black,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String newsurl) async {
    final Uri url = Uri.parse(newsurl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
