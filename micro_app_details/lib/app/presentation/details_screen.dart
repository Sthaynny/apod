import 'package:flutter/material.dart';
import 'package:micro_common/app/domain/entity/apod_entity.dart';
import 'package:micro_common/app/presentation/image_shimmer_widget.dart';
import 'package:micro_dependency/micro_dependency.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.apod}) : super(key: key);
  final ApodEntity apod;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ApodEntity get apod => widget.apod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(apod.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              CachedNetworkImage(
                imageUrl: apod.hdurl,
                fit: BoxFit.cover,
                placeholder: (context, url) => ImageShimmerWidget(
                  height: 500.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Text(
                  apod.explanation,
                  style: AppStyle.regular(),
                  textAlign: TextAlign.justify,
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
                        text: apod.date,
                        style: AppStyle.h3(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
