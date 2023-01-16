import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/app/router/routes_app.dart';
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              apodEntity.title,
              style: AppStyle.h2(),
            ),
            const SizedBox(
              height: 16,
            ),
            CachedNetworkImage(
              imageUrl: apodEntity.hdurl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const ImageShimmerWidget(
                height: 500,
              ),
              errorWidget: (context, url, error) => DefaultErrorWidget(
                height: 500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
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
                Navigator.of(context).pushNamed(
                  Routes.details,
                  arguments: apodEntity,
                );
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
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
