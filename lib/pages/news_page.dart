import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalpas_task/details_screen.dart';
import 'package:kalpas_task/logic/favs_cubit/favs_cubit.dart';
import 'package:kalpas_task/logic/news_cubit/news_cubit.dart';
import 'package:kalpas_task/widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NewsCubit, NewsState>(
          listener: (context, state) {
            if (state is NewsFetchFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.msg)),
              );
            }
          },
        ),
        BlocListener<FavsCubit, FavsState>(
          listener: (context, state) {
            if (state is FavsSaveSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Added to Favs Successfully!")),
              );
            } else if (state is FavsSaveFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.msg)),
              );
            }
          },
        )
      ],
      child: Center(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const CircularProgressIndicator();
            } else if (state is NewsFetchSuccess) {
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
                      isSlidable: true,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(article: article, isFav: false),
                      )),
                      onAddToFav: () =>
                          context.read<FavsCubit>().saveToFavs(article),
                    );
                  }
                },
              );
            } else if (state is NewsFetchFailed) {
              return Column(
                children: [const Icon(CupertinoIcons.info), Text(state.msg)],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
