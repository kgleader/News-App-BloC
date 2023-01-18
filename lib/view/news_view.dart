import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/service/news_service.dart';
import '../bloc/news_bloc.dart';
import '../components/loading_widget.dart';
import '../models/news_model.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsBloc(newsService)..add(const NewsByCountryCodeEvent()),
      child: const NewsView(),
    );
  }
}

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsView'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const LoadingWidget();
          } else if (state is NewsSuccess) {
            return NewsSuccessWidget(state.news);
          } else if (state is NewsError) {
            return ErrorWidget(state.text);
          } else {
            return ErrorWidget('belgisiz state');
          }
        },
      ),
    );
  }
}

class NewsSuccessWidget extends StatelessWidget {
  const NewsSuccessWidget(this.news, {super.key});

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        final newsItem = news[index];
        return Card(
          child: ListTile(
            title: Text(newsItem.title),
          ),
        );
      },
    );
  }
}
