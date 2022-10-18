import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/app/helper/my_colors.dart';
import 'package:news_app/app/helper/my_time.dart';
import 'package:news_app/gen/assets.gen.dart';
import 'package:sizer/sizer.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  const NewsDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {

            return [
              SliverAppBar(
                expandedHeight: 30.h,
                pinned: true,
                backgroundColor: MyColors.primary,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    controller.article.urlToImage ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Lottie.asset(Assets.lotties.errorImage2);
                    },
                  ),

                  // titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                ),
              )
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.article.title ?? "",style: GoogleFonts.inriaSans(fontWeight: FontWeight.bold,fontSize: 18.sp)),
                SizedBox(height: 2.h),
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person),
                        Text(controller.article.author ?? ""),
                      ],
                    ),
                    SizedBox(width: 5.w,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.access_time_sharp),
                        Text(MyTime.parse(controller.article.publishedAt ?? "").format("EEEE, dd MMMM yyyy")),

                      ],
                    ),

                  ],
                ),
                SizedBox(height: 2.h),
                Text(controller.article.description??"",style: GoogleFonts.inriaSerif(fontSize: 11.sp),textAlign: TextAlign.justify,)
              ],
            ),
          )
        ),
      ),
    );
  }
}
