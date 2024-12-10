import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_app/src/core/router/app_go_router.dart';
import 'package:ny_times_app/src/core/router/app_go_router.gr.dart';
import 'package:ny_times_app/src/features/articles/presentation/bloc/articles_bloc.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.read<ArticlesBloc>().allArticles;
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              context.navigateTo(
                  ArticlesTab(children: [ArticleDetailsRoute(model: data[0])]));
            },
            child: Text("Settings page ${data.length}")),
      ),
    );
  }
}
