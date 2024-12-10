import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_app/src/core/router/app_go_router.gr.dart';
import 'package:ny_times_app/src/core/utils/injections.dart';
import 'package:ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';
import 'package:ny_times_app/src/features/articles/presentation/bloc/articles_bloc.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArticlesBloc(articlesRepository: sl<AbstractArticlesRepository>()),
      child: AutoTabsScaffold(
        routes: [ArticlesRoute(), SettingsRoute()],
        bottomNavigationBuilder: (_, tabRouter) => BottomNavigationBar(
            currentIndex: tabRouter.activeIndex,
            onTap: tabRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Articles"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Settings"),
            ]),
      ),
    );
  }
}
