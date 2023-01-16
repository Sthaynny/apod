import 'package:flutter/material.dart';
import 'package:micro_app_home/app/presentation/components/apod_info.dart';
import 'package:micro_app_home/app/presentation/components/home_erro.dart';
import 'package:micro_app_home/app/presentation/components/home_loading.dart';
import 'package:micro_app_home/app/presentation/cubit/home_cubit.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:micro_dependency/micro_dependency.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = dependency<HomeCubit>();
  }

  @override
  void dispose() {
    NetworkErrorObserver.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Astronomy Picture of the Day',
          style: AppStyle.h1(),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: cubit..getApodDetails(),
        builder: (context, state) {
          if (state is HomeLoaded) {
            return ApodInfoWidget(
              apodEntity: state.apod,
            );
          }
          if (state is HomeError) {
            return const HomeErrorWidget();
          }

          return const HomeLoadingWidget();
        },
      ),
    );
  }
}
