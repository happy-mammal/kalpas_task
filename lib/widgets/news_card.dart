import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:kalpas_task/models/article_model.dart';

class NewsCard extends StatefulWidget {
  final Article article;
  final bool isSlidable;
  final VoidCallback onAddToFav, onTap;
  const NewsCard(
      {super.key,
      required this.article,
      required this.onAddToFav,
      required this.isSlidable,
      required this.onTap});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> with TickerProviderStateMixin {
  late final SlidableController _controller;
  late final DateTime _dateTime;
  late String _formattedDateTime;

  @override
  void initState() {
    _controller = SlidableController(this);
    _dateTime = DateTime.parse(widget.article.publishedAt!);
    _formattedDateTime =
        '${DateFormat('E, d MMM yyyy HH:mm').format(_dateTime.toUtc())} GMT';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      child: Container(
        padding: EdgeInsets.all(7.4.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 17.42),
              blurRadius: 85.15,
              spreadRadius: -3.87,
              color: const Color(0xFF18274B).withOpacity(0.14),
            ),
            BoxShadow(
              offset: const Offset(0, 7.74),
              blurRadius: 27.09,
              spreadRadius: -5.81,
              color: const Color(0xFF18274B).withOpacity(0.12),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11.61.r),
          child: Container(
            color: Colors.white,
            width: 377.77.w,
            height: 141.67.h,
            child: Slidable(
              controller: _controller,
              endActionPane: widget.isSlidable
                  ? ActionPane(
                      extentRatio: 0.2,
                      motion: const ScrollMotion(),
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _controller.close();
                              widget.onAddToFav();
                            },
                            child: Container(
                              color: const Color(0xFFFCD1D1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.heart_fill,
                                    size: 27.sp,
                                    color: const Color(0xFFFA6464),
                                  ),
                                  SizedBox(height: 14.06.h),
                                  Text(
                                    "Add to Favorite",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : null,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 12.58.h, horizontal: 17.42.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        widget.article.urlToImage!,
                        width: 96.w,
                        height: 96.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 96.w,
                          height: 96.h,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 7.74.w),
                    SizedBox(
                      width: 215.w,
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              widget.article.title!,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15.48.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.article.description ?? "",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15.48.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
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
                                  _formattedDateTime,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFFB9B9B9)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
