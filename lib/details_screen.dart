import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kalpas_task/models/article_model.dart';

class DetailsScreen extends StatelessWidget {
  final Article article;
  final bool isFav;
  const DetailsScreen({
    super.key,
    required this.article,
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(article.publishedAt!);
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.back,
                      size: 19.sp,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                          height: 0,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              SizedBox(height: 22.28.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.28.r),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.network(
                              article.urlToImage!,
                              width: 361.w,
                              height: 201.58.h,
                              fit: BoxFit.cover,
                            ),
                            isFav
                                ? Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: const Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Color(0xFFFA6464),
                                      size: 30.85,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      SizedBox(height: 22.28.h),
                      Text(
                        article.title!,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 24.68.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10.28.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            CupertinoIcons.calendar_today,
                            size: 17.42.sp,
                            color: const Color(0xFFB9B9B9),
                          ),
                          SizedBox(width: 7.47.w),
                          Expanded(
                            child: Text(
                              "${DateFormat('E, d MMM yyyy HH:mm').format(dateTime.toUtc())} GMT",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFB9B9B9)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22.28.h),
                      Text(
                        article.description!,
                        style: TextStyle(
                          fontSize: 15.92.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
