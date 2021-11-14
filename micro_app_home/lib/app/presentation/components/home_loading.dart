import 'package:flutter/material.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
