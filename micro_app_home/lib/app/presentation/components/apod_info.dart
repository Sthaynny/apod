import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependency/micro_dependency.dart';

class ApodInfoWidget extends StatelessWidget {
  const ApodInfoWidget({
    Key? key,
    required this.apodEntity,
  }) : super(key: key);

  final ApodEntity apodEntity;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              apodEntity.title,
              style: AppStyle.h2(),
            ),
            SizedBox(
              height: 16.h,
            ),
            CachedNetworkImage(
              imageUrl: apodEntity.hdurl,
              fit: BoxFit.cover,
              placeholder: (context, url) => ImageShimmerWidget(
                height: 500.h,
              ),
              errorWidget: (context, url, error) => DefaultErrorWidget(
                height: 500.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Text.rich(
                TextSpan(
                  text: 'Date: ',
                  style: AppStyle.h3(
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: apodEntity.date,
                      style: AppStyle.h3(),
                    )
                  ],
                ),
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                EventBus.emit(apodEntity.eventDatails);
              },
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Details',
                  style: AppStyle.h2(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
