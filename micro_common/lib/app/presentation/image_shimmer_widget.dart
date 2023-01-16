import 'package:flutter/material.dart';
import 'package:micro_dependency/micro_dependency.dart';

const defaultShimmerBaseColor = Color.fromRGBO(64, 64, 64, 0.5);
const defaultShimmerHighlightColor = Color.fromRGBO(166, 166, 166, 1.0);
const defaultShimmerBackColor = Color.fromRGBO(217, 217, 217, 0.5);

class ImageShimmerWidget extends StatelessWidget {
  const ImageShimmerWidget({
    Key? key,
    this.width,
    this.height,
    this.shimmerDirection = ShimmerDirection.ltr,
    this.shimmerDuration = const Duration(milliseconds: 1500),
    this.boxDecoration,
    this.baseColor = defaultShimmerBaseColor,
    this.highlightColor = defaultShimmerHighlightColor,
    this.backColor = defaultShimmerBackColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final ShimmerDirection shimmerDirection;
  final Duration shimmerDuration;
  final Color baseColor;
  final Color highlightColor;
  final Color backColor;
  final BoxDecoration? boxDecoration;

  @override
  Widget build(BuildContext context) {
    if (boxDecoration != null) {
      return Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        direction: shimmerDirection,
        period: shimmerDuration,
        child: Container(
          width: width,
          height: height,
          decoration: boxDecoration,
        ),
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        direction: shimmerDirection,
        period: shimmerDuration,
        child: Container(
          width: width,
          height: height,
          color: backColor,
        ),
      ),
    );
  }
}
