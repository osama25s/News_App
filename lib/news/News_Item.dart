import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: Image.asset(
              'assets/images/NewsTest.png',
              width: double.infinity,
              height: 230.h,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'BBCNews',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 12.sp, color: Colors.grey),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Why are footballs biggest clubs starting a new tournament?',
            maxLines: 2,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(DateTime.now()),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 12.sp, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
