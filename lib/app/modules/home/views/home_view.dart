import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/app/helper/my_colors.dart';
import 'package:news_app/app/helper/my_toast.dart';
import 'package:news_app/app/modules/home/models/category_model.dart';
import 'package:news_app/app/modules/home/views/article_item_view.dart';
import 'package:news_app/gen/assets.gen.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.botNavIndex.value,
          onTap: (value) {
            controller.botNavIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                label: "Home",
                backgroundColor: MyColors.primary),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fact_check_outlined,
                  color: Colors.white,
                ),
                label: "News"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                label: "Notification"),
          ],
        );
      }),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              SizedBox(height: 3.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("My News Apps", style: GoogleFonts.inriaSerif(fontSize: 25.sp, color: MyColors.primary)),
                        SizedBox(height: 2.h),
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(2.w))),
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                  child: TextFormField(
                                    controller: controller.textSearchController,
                                    textInputAction: TextInputAction.search,
                                    decoration: const InputDecoration.collapsed(hintText: "Search"),
                                    style: GoogleFonts.inriaSerif(fontSize: 14.sp),
                                    onFieldSubmitted: (value) {
                                      // if(value.isNotEmpty){
                                      controller.getNews(keyword: value);
                                      // }
                                    },
                                  )),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(Assets.icons.icFilter),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Categories",
                          style: GoogleFonts.inriaSerif(fontSize: 16.sp),
                        ),

                      ],
                    ),
                  ),

                  Container(
                    height: 10.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 3.5.w),
                      children: controller.categoryList.map((e) => CategoryItemView(categoryModel: e)).toList(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Obx(() {
                    if (!controller.isLoading.value) {
                      if (controller.mArticleList.isNotEmpty) {
                        return ListView.builder(
                          itemCount: controller.mArticleList.length,
                          shrinkWrap: true,
                          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4 / 5),
                          itemBuilder: (BuildContext context, int index) {
                            var article = controller.mArticleList[index];
                            return ArticleItemView(article: article);
                          },
                        );
                      } else {
                        return Center(child: Lottie.asset(Assets.lotties.dataNotFound));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItemView extends GetView<HomeController> {
  const CategoryItemView({Key? key, required this.categoryModel}) : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.5.w,vertical: 2.h),
      child: Obx(() {
        return ElevatedButton(
            onPressed: () async{
              var categoryFilter = categoryModel.value;
              if(categoryModel.isActive.isTrue){
                categoryFilter = "";
              }
              await controller.getNews(category: categoryFilter);
              controller.textSearchController.clear();

              controller.categoryList.forEach((element) {
                if(element!= categoryModel){
                  element.isActive.value = false;
                }
              });
              categoryModel.isActive.toggle();
            },
            style: ElevatedButton.styleFrom(
              elevation: 3.sp,
                foregroundColor: categoryModel.isActive.isTrue ? Colors.white : MyColors.primary,
                backgroundColor: categoryModel.isActive.isTrue ? MyColors.primary : Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.h)) )),
            child: Text(categoryModel.value.toUpperCase()));
      }),
    );
  }
}
