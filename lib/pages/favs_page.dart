import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalpas_task/details_screen.dart';
import 'package:kalpas_task/logic/favs_cubit/favs_cubit.dart';
import 'package:kalpas_task/widgets/news_card.dart';

class FavsPage extends StatelessWidget {
  const FavsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<FavsCubit, FavsState>(
        builder: (context, state) {
          if (state is FavsLoading) {
            return const CircularProgressIndicator();
          } else if (state is FavsFetchSuccess) {
            return ListView.builder(
              padding: EdgeInsets.all(7.74.w),
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                var article = state.articles[index];
                if (article.urlToImage == null ||
                    article.title == null ||
                    article.description == null ||
                    article.publishedAt == null) {
                  return Container();
                } else {
                  return NewsCard(
                    article: article,
                    isSlidable: false,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(article: article, isFav: true),
                    )),
                    onAddToFav: () =>
                        context.read<FavsCubit>().saveToFavs(article),
                  );
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
