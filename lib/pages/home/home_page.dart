import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/pages/home/widget/item_card.dart';
import 'package:login/pages/home/widget/text_field_search.dart';

import '../../gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: SvgPicture.asset(Assets.icons.icLogo)),
              SizedBox(height: 8.h),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFSearch(context),
                    SizedBox(height: 16.h),
                    SingleChildScrollView(
                      child: Row(children: [ItemFood(context)]),
                    ),
                    SizedBox(
                      height: 200, // chiều cao card (bạn tùy chỉnh)
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // 5 card
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width:
                                screenWidth / 2 -
                                16, // Mỗi card chiếm 1/2 màn hình
                            child: Card(
                              color: Colors.blue[100 * ((index % 8) + 1)],
                              child: Center(child: Text('Card ${index + 1}')),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
