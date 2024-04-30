import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalpas_task/home_screen.dart';
import 'package:kalpas_task/logic/favs_cubit/favs_cubit.dart';
import 'package:kalpas_task/logic/news_cubit/news_cubit.dart';
import 'package:kalpas_task/services/local_db_service.dart';
import 'package:kalpas_task/services/news_api_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => NewsCubit(NewsApiService())),
            BlocProvider(create: (context) => FavsCubit(LocalDbService())),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Roboto'),
            title: 'First Method',
            home: child,
          ),
        );
      },
      child: const HomeScreen(),
    );
  }
}
