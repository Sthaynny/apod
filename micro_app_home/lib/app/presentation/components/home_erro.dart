import 'package:flutter/material.dart';
import 'package:micro_dependency/micro_dependency.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something unexpected happened...\nPlease, try again.',
        style: AppStyle.h1(),
      ),
    );
  }
}
