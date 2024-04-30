import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalpas_task/logic/favs_cubit/favs_cubit.dart';
import 'package:kalpas_task/logic/news_cubit/news_cubit.dart';
import 'package:kalpas_task/models/custom_tab_bar_item.dart';
import 'package:kalpas_task/pages/favs_page.dart';
import 'package:kalpas_task/pages/news_page.dart';
import 'package:kalpas_task/widgets/custom_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;
  late final List<CustomTabBarItem> _tabBarItems;

  @override
  void initState() {
    _selectedIndex = 0;
    _tabBarItems = [
      CustomTabBarItem(
        title: "News",
        iconSize: 33.sp,
        icon: CupertinoIcons.list_bullet,
      ),
      CustomTabBarItem(
        title: "Favs",
        iconColor: const Color(0xFFFA6464),
        iconSize: 36.sp,
        icon: CupertinoIcons.heart_fill,
      ),
    ];

    BlocProvider.of<NewsCubit>(context).fetchNews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTabView(
      tabBarItems: _tabBarItems,
      selectedIndex: _selectedIndex,
      onTabPressed: (value) {
        if (value == 0) {
          context.read<NewsCubit>().fetchNews();
        } else {
          context.read<FavsCubit>().fetchFavs();
        }
        setState(() => _selectedIndex = value);
      },
      activeTabColor: const Color(0xFFEEF3FD),
      tabItemTextStyle: TextStyle(
        height: 0,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
      ),
      tabViewItems: const [
        NewsPage(),
        FavsPage(),
      ],
    );
  }
}
