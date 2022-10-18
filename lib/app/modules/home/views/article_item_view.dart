import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/app/helper/my_colors.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/app/modules/home/models/Response_news_model.dart';
import 'package:news_app/app/routes/app_pages.dart';
import 'package:news_app/gen/assets.gen.dart';
import 'package:sizer/sizer.dart';

class ArticleItemView extends GetView<HomeController> {
  const ArticleItemView({Key? key, required this.article}) : super(key: key);
  final Articles article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.5.h, left: 5.w, right: 5.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicHeight(
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.NEWS_DETAIL,arguments: article);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 25.w,
                      height: 25.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                          child: Image.network(
                            article.urlToImage ?? "",
                            fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) {
                              return Lottie.asset(Assets.lotties.errorImage2);
                            },
                          ))),
                  SizedBox(width: 4.w),
                  Expanded(
                      // flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article.title ?? "", maxLines : 2, overflow: TextOverflow.ellipsis,style: GoogleFonts.inriaSerif(fontSize: 12.sp, fontWeight: FontWeight.bold)),
                          SizedBox(height: 1.h),
                          Text(article.description ?? "",maxLines: 3,overflow: TextOverflow.ellipsis, style: GoogleFonts.inriaSerif(fontSize: 10.sp)),
                          Expanded(child: Container()),
                        ],
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding: EdgeInsets.all(1.w),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topCenter, colors: [MyColors.primary, MyColors.primaryAccent])),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 4.w,
                        )),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                    height: 0.5,
                    color: Colors.grey,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
