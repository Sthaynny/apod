import 'package:flutter/material.dart';
import 'package:micro_app_home/app/presentation/cubit/home_cubit.dart';
import 'package:micro_dependency/micro_dependency.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
